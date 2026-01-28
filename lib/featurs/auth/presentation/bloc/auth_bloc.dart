import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_error_handler.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const AuthInitial()) {
    on<SignInWithGoogle>(_onSignInWithGoogle);
    on<SignInWithFacebook>(_onSignInWithFacebook);
    on<SignInWithApple>(_onSignInWithApple);
    on<SendOtp>(_onSendOtp);
    on<VerifyOtp>(_onVerifyOtp);
    on<SignOut>(_onSignOut);
    on<CheckAuthStatus>(_onCheckAuthStatus);
  }

  Future<void> _onSignInWithGoogle(
    SignInWithGoogle event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final userCredential = await _authRepository.signInWithGoogle();
      final userModel = await _authRepository.provisionUser(
        userCredential.user!,
      );
      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(AuthFailure(AuthErrorHandler.getErrorMessage(e)));
    }
  }

  Future<void> _onSignInWithFacebook(
    SignInWithFacebook event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final userCredential = await _authRepository.signInWithFacebook();
      final userModel = await _authRepository.provisionUser(
        userCredential.user!,
      );
      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(AuthFailure(AuthErrorHandler.getErrorMessage(e)));
    }
  }

  Future<void> _onSignInWithApple(
    SignInWithApple event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());
    try {
      final userCredential = await _authRepository.signInWithApple();
      final userModel = await _authRepository.provisionUser(
        userCredential.user!,
      );
      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(AuthFailure(AuthErrorHandler.getErrorMessage(e)));
    }
  }

  Future<void> _onSendOtp(SendOtp event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final verificationId = await _authRepository.sendOtp(event.phoneNumber);
      emit(
        OtpSent(verificationId: verificationId, phoneNumber: event.phoneNumber),
      );
    } catch (e) {
      emit(AuthFailure(AuthErrorHandler.getErrorMessage(e)));
    }
  }

  Future<void> _onVerifyOtp(VerifyOtp event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      final userCredential = await _authRepository.verifyOtp(
        event.verificationId,
        event.code,
      );
      final userModel = await _authRepository.provisionUser(
        userCredential.user!,
      );
      emit(AuthSuccess(userModel));
    } catch (e) {
      emit(AuthFailure(AuthErrorHandler.getErrorMessage(e)));
    }
  }

  Future<void> _onSignOut(SignOut event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    try {
      await _authRepository.signOut();
      emit(const Unauthenticated());
    } catch (e) {
      emit(AuthFailure(AuthErrorHandler.getErrorMessage(e)));
    }
  }

  Future<void> _onCheckAuthStatus(
    CheckAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    try {
      final firebaseUser = _authRepository.currentUser;
      if (firebaseUser != null) {
        final userModel = await _authRepository.provisionUser(firebaseUser);
        emit(AuthSuccess(userModel));
      } else {
        emit(const Unauthenticated());
      }
    } catch (e) {
      emit(const Unauthenticated());
    }
  }
}
