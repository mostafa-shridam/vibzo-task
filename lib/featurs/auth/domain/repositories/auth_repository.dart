import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';

abstract class AuthRepository {
  Future<UserCredential> signInWithGoogle();
  Future<String> sendOtp(String phoneNumber);
  Future<UserCredential> verifyOtp(String verificationId, String code);
  Future<UserModel> provisionUser(User firebaseUser);
  Future<void> signOut();
  User? get currentUser;
  Stream<User?> get authStateChanges;
}
