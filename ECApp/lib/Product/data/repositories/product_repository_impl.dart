import 'package:ecapp/Product/data/datasources.dart/product_local_data_source.dart';
import 'package:ecapp/Product/data/datasources.dart/product_remote_data_source.dart';
import 'package:ecapp/Product/domain/entities/Cart.dart';
import 'package:ecapp/Product/domain/entities/product..dart';
import 'package:ecapp/Product/domain/entities/categories.dart';
import 'package:ecapp/Product/domain/entities/all_products.dart';
import 'package:dartz/dartz.dart';

import 'package:ecapp/Product/domain/repsitories/product_repository.dart';
import 'package:ecapp/core/Network/Neetwork_info.dart';

import 'package:ecapp/core/errors/Failures.dart';
import 'package:ecapp/core/errors/exception.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSouceImpl productRemoteDataSouceImpl;
  final ProductLocalDataSourceImpl productLocalDataSourceImpl;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.productRemoteDataSouceImpl,
    required this.networkInfo,
    required this.productLocalDataSourceImpl,
  });
  @override
  Future<Either<Failure, Categories>> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await productRemoteDataSouceImpl.getAllCategories();
        return right(result);
      } on GetCateoriesException {
        return left(GetCategoriesFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AllProducts>> getAllProducts() async {
    if (await networkInfo.isConnected) {
      try {
        final result = await productRemoteDataSouceImpl.getAllProducts();
        return right(result);
      } on GetAllProductException {
        return left(GetAllProductsFailure());
      }
    } else {
      throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, AllProducts>> getProductByCategories(
      String category) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await productRemoteDataSouceImpl.getProductByCategories(category);
        return right(result);
      } on GetProductsByCategoryException {
        return left(GetAllProductsFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Product>> getSingleProduct(int productId) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await productRemoteDataSouceImpl.getSingleProduct(productId);
        return right(result);
        // ignore: nullable_type_in_catch_clause
      } on GetProductsByCategoryException {
        return left(GetSingleProductFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, AllProducts>> searchProduct(String query) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await productRemoteDataSouceImpl.searchProduct(query);
        return right(result);
      } on GetProductsByCategoryException {
        return left(GetAllProductsFailure());
      }
    } else {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Cart>> addCart(
      int userId, List productCartList) async {
    if (await networkInfo.isConnected) {
      try {
        final result =
            await productRemoteDataSouceImpl.addCart(userId, productCartList);
        return right(result);
      } on AddCartException {
        return left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> cacheValue(int productId) async {
    if (await networkInfo.isConnected) {
      try {
        await productLocalDataSourceImpl.cacheCart(productId);
        return Future.value(right(unit));
      } on CacheValueException {
        return left(ServerFailure());
      }
    } else {
      return Left(ServerFailure());
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getCachedvalue() async {
    List<Map<String, dynamic>> listOfProductCart =
        await productLocalDataSourceImpl.getCachedCart();
    return Future.value(listOfProductCart);
  }
}
