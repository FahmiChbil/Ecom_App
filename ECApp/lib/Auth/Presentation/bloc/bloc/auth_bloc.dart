import 'package:dartz/dartz.dart';
import 'package:ecapp/Auth/Domain/UseCases/Sign_In_Use_Case.dart';
import 'package:ecapp/Auth/Domain/UseCases/Sign_up_useCase.dart';
import 'package:ecapp/Auth/Domain/entites/User.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/strings/failures.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SignInUseCase signInUseCase;
  SignUpUseCase signUpUseCase;
  AuthBloc({required this.signInUseCase, required this.signUpUseCase})
      : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is SignInEvent) {
        emit(LoadingSignInState());
        final failedOrSucced =
            await signInUseCase(event.username, event.password);
        emit(mapFailedOrSuccedSignIn(failedOrSucced));
      } else if (event is SignUpEvent) {
        emit(LoadingSignInState());
        final failureOrSuccedSignUp =
            await signUpUseCase(event.email, event.password, event.username);
        emit(mapFailedOrSuccedSignUp(failureOrSuccedSignUp));
      }
    });
  }
}

AuthState mapFailedOrSuccedSignIn(Either<Failure, User> either) {
  return either.fold(
      (l) => ErrorSignInState(errorMessage: _mapFailureToMessage(l)),
      (r) => SuccesSignInStat(user: r));
}

AuthState mapFailedOrSuccedSignUp(Either<Failure, Unit> either) {
  return either.fold(
      (l) => ErrorSignUpState(errorMessage: _mapFailureToMessage(l)),
      (r) => SuccesSignUpStat());
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;

    case OfflinFailure:
      return OFFLINE_FAILURE_MESSAGE;
    case SignInFailure:
      return SERVER_FAILURE_MESSAGE;

    default:
      return 'unexpected error , please try later ';
  }
}
