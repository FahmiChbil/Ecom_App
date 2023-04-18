// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String email;
  final String image;
  final String token;
  const User(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.username,
      required this.password,
      required this.email,
      required this.image,
      required this.token});

  @override
  List<Object?> get props =>
      [id, firstName, lastName, username, password, email, image, token];
}
