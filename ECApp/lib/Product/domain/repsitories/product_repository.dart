import 'package:dartz/dartz.dart';

import 'package:ecapp/core/errors/Failures.dart';
import 'package:ecapp/Product/domain/entities/all_products.dart';
import 'package:ecapp/Product/domain/entities/categories.dart';
import 'package:ecapp/Product/domain/entities/product..dart';

import '../entities/Cart.dart';

abstract class ProductRepository {
  Future<Either<Failure, AllProducts>> getAllProducts();
  Future<Either<Failure, Product>> getSingleProduct(int productId);
  Future<Either<Failure, AllProducts>> searchProduct(String query);
  Future<Either<Failure, Categories>> getAllCategories();
  Future<Either<Failure, AllProducts>> getProductByCategories(String category);
  Future<Either<Failure, Cart>> addCart(int userId, List productCartList);
  Future<Either<Failure, Unit>> cacheValue(int productId);
  Future<List<Map<String, dynamic>>> getCachedvalue();
}
