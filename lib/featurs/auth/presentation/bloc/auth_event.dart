import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class SignInWithGoogle extends AuthEvent {
  const SignInWithGoogle();
}

class SendOtp extends AuthEvent {
  final String phoneNumber;

  const SendOtp(this.phoneNumber);

  @override
  List<Object?> get props => [phoneNumber];
}

class VerifyOtp extends AuthEvent {
  final String verificationId;
  final String code;

  const VerifyOtp({required this.verificationId, required this.code});

  @override
  List<Object?> get props => [verificationId, code];
}

class SignOut extends AuthEvent {
  const SignOut();
}

class CheckAuthStatus extends AuthEvent {
  const CheckAuthStatus();
}
