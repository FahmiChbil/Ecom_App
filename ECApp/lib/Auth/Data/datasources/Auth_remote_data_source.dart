// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecapp/Auth/Data/models/UserModel.dart';

import 'package:http/http.dart' as http;

import '../../../core/const.dart';
import '../../../core/errors/exception.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> getToken(String username, password);
  Future<Unit> addUser(String username, password, email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<UserModel> getToken(String username, password) async {
    final response = await http.post(Uri.parse(getTokenUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
        }));
    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw AuthException();
    }
  }

  @override
  Future<Unit> addUser(String username, password, email) async {
    final response = await http.post(Uri.parse(addUserUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          'username': username,
          'password': password,
          'email': email
        }));
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw AddUserException();
    }
  }
}
