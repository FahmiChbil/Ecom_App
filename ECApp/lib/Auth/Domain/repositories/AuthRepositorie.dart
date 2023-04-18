// ignore_for_file: file_names

import 'package:dartz/dartz.dart';
import 'package:ecapp/Auth/Domain/entites/User.dart';

import '../../../core/errors/Failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> getToken(String username, password);
  Future<Either<Failure, Unit>> addUser(String username, password, email);
}
