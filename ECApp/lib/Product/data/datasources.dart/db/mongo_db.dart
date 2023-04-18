// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:ecapp/Product/data/datasources.dart/db/db_setup.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDataBase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_URl);
    await db.open();
    inspect(db);
    userCollection = await db.collection(COLLECTION_NAME);
  }

  static Future<String> insert(Map<String, dynamic> data) async {
    try {
      var result = await userCollection.insertOne(data);
      if (result.isSuccess) {
        return "data inserted";
      } else {
        return "Somthing went wrong";
      }
    } catch (e) {
      return e.toString();
    }
  }

  static Future<List<Map<String, dynamic>>> getData() async {
    final listOfProduct = await userCollection.find().toList();
    return listOfProduct;
  }
}
