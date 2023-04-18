// ignore_for_file: file_names

import 'package:ecapp/Auth/Domain/entites/User.dart';

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.firstName,
      required super.lastName,
      required super.username,
      required super.password,
      required super.email,
      required super.image,
      required super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        username: json['username'],
        password: json['password'],
        email: json['email'],
        image: json['image'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password, 'email': email};
  }
}
