import 'package:dartz/dartz.dart';
import 'package:ecapp/Auth/Data/datasources/Auth_remote_data_source.dart';
import 'package:ecapp/Auth/Domain/entites/User.dart';

import 'package:ecapp/Auth/Domain/repositories/AuthRepositorie.dart';
import 'package:ecapp/core/Network/Neetwork_info.dart';

import '../../../core/errors/Failures.dart';
import '../../../core/errors/exception.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSourceImpl authRemoteDataSourceImpl;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.authRemoteDataSourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, User>> getToken(String username, password) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await authRemoteDataSourceImpl.getToken(username, password);
        return right(result);
      } on AuthException {
        return left(ServerFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> addUser(
      String username, password, email) async {
    if (await networkInfo.isConnected) {
      try {
        await authRemoteDataSourceImpl.addUser(username, password, email);
        return right(unit);
      } on AuthException {
        return left(AddUserFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }
}
