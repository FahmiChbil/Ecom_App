// ignore_for_file: constant_identifier_names, unnecessary_null_comparison

import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/data/datasources.dart/db/mongo_db.dart';

import 'package:ecapp/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<Map<String, dynamic>>> getCachedCart();
  Future<Unit> cacheCart(int productId);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  SharedPreferences sharedPreferences;
  static const CACHED_CARTS = "CACHED_CARTS";

  ProductLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<Unit> cacheCart(productId) {
    Map<String, dynamic> productCartModelToJson = {
      "id": productId,
      "quantity": 1,
    };

    MongoDataBase.insert(productCartModelToJson);

    // sharedPreferences.setString(
    //     CACHED_CARTS, jsonEncode(productCartModelToJson));

    return Future.value(unit);
  }

  @override
  Future<List<Map<String, dynamic>>> getCachedCart() async {
    final jsonString = await MongoDataBase.getData();
    if (jsonString == null) {
      // Map<String, dynamic> decodedJsonData = jsonDecode(jsonString);
      throw EmptyCacheException();
    } else {
      return Future.value(jsonString);
    }
  }
}
