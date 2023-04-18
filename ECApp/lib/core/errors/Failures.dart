// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class OfflinFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class AddUserFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class SignInFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetCategoriesFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetAllProductsFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetProductsFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetSingleProductFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}
