part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class LoadingSignInState extends AuthState {}

class SuccesSignInStat extends AuthState {
  final User user;
  SuccesSignInStat({required this.user});
}

class SuccesSignUpStat extends AuthState {}

class ErrorSignInState extends AuthState {
  final String errorMessage;
  const ErrorSignInState({required this.errorMessage});
}

class ErrorSignUpState extends AuthState {
  final String errorMessage;
  const ErrorSignUpState({required this.errorMessage});
}
