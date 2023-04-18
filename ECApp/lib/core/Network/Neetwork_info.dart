// ignore_for_file: file_names

import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
  final InternetConnectionChecker connectionChecker;
  NetworkInfoImpl(this.connectionChecker);
}
