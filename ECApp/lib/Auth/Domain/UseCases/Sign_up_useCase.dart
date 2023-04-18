// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:ecapp/Auth/Domain/repositories/AuthRepositorie.dart';

import '../../../core/errors/Failures.dart';

class SignUpUseCase {
  final AuthRepository authRepository;
  SignUpUseCase(this.authRepository);

  Future<Either<Failure, Unit>> call(String username, password, email) async {
    return authRepository.addUser(username, password, email);
  }
}
