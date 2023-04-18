// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:ecapp/Auth/Domain/entites/User.dart';
import 'package:ecapp/Auth/Domain/repositories/AuthRepositorie.dart';

import '../../../core/errors/Failures.dart';

class SignInUseCase {
  final AuthRepository authRepository;
  SignInUseCase(this.authRepository);
  Future<Either<Failure, User>> call(String username, password) async {
    return authRepository.getToken(username, password);
  }
}
