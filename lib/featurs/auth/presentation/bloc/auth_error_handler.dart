import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthErrorHandler {
  static String getErrorMessage(dynamic error) {
    // FirebaseAuthException
    if (error is FirebaseAuthException) {
      return _handleFirebaseAuthError(error);
    }

    // GoogleSignInException
    if (error is GoogleSignInException) {
      return _handleGoogleSignInError(error);
    }
    return error.toString();
  }

  static String _handleFirebaseAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return 'No user found with this credential';
      case 'wrong-password':
        return 'Incorrect password';
      case 'user-disabled':
        return 'This account has been disabled';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later';
      case 'operation-not-allowed':
        return 'This sign-in method is not enabled';
      case 'email-already-in-use':
        return 'An account already exists with this email';
      case 'invalid-email':
        return 'Invalid email address';
      case 'weak-password':
        return 'Password is too weak';
      case 'account-exists-with-different-credential':
        return 'Account exists with different credentials';
      case 'invalid-credential':
        return 'Invalid credentials provided';
      case 'invalid-verification-code':
        return 'Invalid verification code';
      case 'invalid-verification-id':
        return 'Invalid verification ID';
      case 'session-expired':
        return 'Session expired. Please try again';
      case 'cancelled':
        return 'Sign in was cancelled';
      case 'network-request-failed':
        return 'Network error. Please check your connection';
      case 'invalid-phone-number':
        return 'Invalid phone number format';
      case 'missing-phone-number':
        return 'Please provide a phone number';
      case 'quota-exceeded':
        return 'SMS quota exceeded. Please try again later';
      default:
        return error.message ?? 'An unexpected error occurred';
    }
  }

  static String _handleGoogleSignInError(GoogleSignInException error) {
    switch (error.description) {
      case 'canceled':
        return 'Google sign-in was cancelled by the user';
      case 'sign_in_failed':
        return 'Google sign-in failed. Please try again';
      case 'network_error':
        return 'Network error. Check your connection';
      default:
        return error.description ??
            'An unexpected Google sign-in error occurred';
    }
  }
}
