import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:company_task/core/enums/constants_enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';


import '../models/user_model.dart';
import '../../data/services/local_auth_service.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  final LocalAuthService _localAuthService;

  AuthRepositoryImpl({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
    FirebaseFirestore? firestore,
    LocalAuthService? localAuthService,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance,
       _googleSignIn = googleSignIn ?? GoogleSignIn.instance,
       _firestore = firestore ?? FirebaseFirestore.instance,
       _localAuthService = localAuthService ?? LocalAuthService();

  @override
  User? get currentUser => _firebaseAuth.currentUser;

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
  void _googleInit() async {
    if (kIsWeb) {
      await _googleSignIn.initialize();
      return;
    }
    await _googleSignIn.initialize(
      serverClientId:
          '716610357517-mslbjrrspobj6veuh2uceup5s29tmopl.apps.googleusercontent.com',
    );
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    _googleInit();
    try {
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      log('Google sign in failed: $e');
      rethrow;
    }
  }


  @override
  Future<String> sendOtp(String phoneNumber) async {
    try {
      String? verificationId;

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _firebaseAuth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          throw e;
        },
        codeSent: (String verId, int? resendToken) {
          verificationId = verId;
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
        },
        timeout: const Duration(seconds: 60),
      );

      await Future.delayed(const Duration(milliseconds: 500));

      if (verificationId == null) {
        throw FirebaseAuthException(
          code: 'verification-failed',
          message: 'Failed to send OTP',
        );
      }

      return verificationId!;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserCredential> verifyOtp(String verificationId, String code) async {
    try {
      final credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: code,
      );

      return await _firebaseAuth.signInWithCredential(credential);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> provisionUser(User firebaseUser) async {
    try {
      final userDoc = _firestore
          .collection(Constants.users.name)
          .doc(firebaseUser.uid);

      final docSnapshot = await userDoc.get();
      late UserModel userModel;

      if (!docSnapshot.exists) {
        // 🟢 create new user
        userModel = UserModel(
          id: firebaseUser.uid,
          name: firebaseUser.displayName ?? '',
          email: firebaseUser.email ?? '',
          avatar: firebaseUser.photoURL,
          createdAt: DateTime.now().toIso8601String(),
          deviceId: '',
          isBlocked: false,
          isVerified: false,
        );

        await userDoc.set(userModel.toJson());
      } else {
        // 🟢 load existing user
        userModel = UserModel.fromJson(docSnapshot.data()!);
      }

      await _localAuthService.saveUser(userModel);

      return userModel;
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'permission-denied':
          throw Exception('Access denied. Please contact support');
        case 'not-found':
          throw Exception('User data not found');
        default:
          throw Exception('Failed to sync user data: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to provision user: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
        _localAuthService.clearUser(),
      ]);
    } catch (e) {
      rethrow;
    }
  }
}
