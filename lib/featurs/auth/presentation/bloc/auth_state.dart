import 'package:equatable/equatable.dart';

import '../../domain/models/user_model.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class OtpSent extends AuthState {
  final String verificationId;
  final String phoneNumber;

  const OtpSent({required this.verificationId, required this.phoneNumber});

  @override
  List<Object?> get props => [verificationId, phoneNumber];
}

class AuthSuccess extends AuthState {
  final UserModel user;

  const AuthSuccess(this.user);

}

class AuthFailure extends AuthState {
  final String message;

  const AuthFailure(this.message);

}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}
