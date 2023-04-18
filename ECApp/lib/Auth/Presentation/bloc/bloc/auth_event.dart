part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends AuthEvent {
  final String username;
  final String password;

  const SignInEvent({required this.username, required this.password});
}

class SignUpEvent extends AuthEvent {
  final String username;
  final String password;
  final String email;

  const SignUpEvent(
      {required this.username, required this.password, required this.email});
}
