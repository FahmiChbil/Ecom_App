import 'dart:convert';

import 'package:ecapp/core/errors/exception.dart';
import 'package:ecapp/Product/data/models/all_product_model.dart';
import 'package:ecapp/Product/data/models/categorie_model.dart';
import 'package:ecapp/Product/data/models/product_model.dart';

import 'package:http/http.dart' as http;

import '../../../core/const.dart';
import '../../../core/urls.dart';
import '../models/Cart_Model.dart';

abstract class ProductRemoteDataSource {
  Future<AllProductModel> getAllProducts();
  Future<ProductModel> getSingleProduct(int productId);
  Future<AllProductModel> searchProduct(String query);
  Future<CategoriesModel> getAllCategories();
  Future<AllProductModel> getProductByCategories(String category);
  Future<CartModel> addCart(int userId, List productCartList);
}

class ProductRemoteDataSouceImpl implements ProductRemoteDataSource {
  ProductRemoteDataSouceImpl();
  @override
  Future<CategoriesModel> getAllCategories() async {
    throw UnimplementedError();
  }

  @override
  Future<AllProductModel> getAllProducts() async {
    final response = await http.get(Uri.parse(getAllProductsUrl));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      AllProductModel allProductModel = AllProductModel.fromJson(decodedJson);
      return allProductModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AllProductModel> getProductByCategories(String category) async {
    final response = await http.get(Uri.parse(getProductByCategory(category)));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      AllProductModel allProductModel = AllProductModel.fromJson(decodedJson);
      return allProductModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getSingleProduct(int productId) async {
    final response = await http.get(Uri.parse(getsingleProductUrl(productId)));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      ProductModel singleProduct = ProductModel.fromJson(decodedJson);
      return singleProduct;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AllProductModel> searchProduct(String query) async {
    final response = await http.get(Uri.parse(searchProductUrl(query)));
    if (response.statusCode == 200) {
      Map<String, dynamic> decodedJson = jsonDecode(response.body);
      AllProductModel searchedProducts = AllProductModel.fromJson(decodedJson);
      return searchedProducts;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CartModel> addCart(int userId, List productCartList) async {
    final response = await http.post(Uri.parse(addCartUrl),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, dynamic>{
          'userId': userId,
          'products': productCartList,
        }));
    if (response.statusCode == 200) {
      return CartModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
