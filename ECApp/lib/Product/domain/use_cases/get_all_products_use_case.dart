// ignore_for_file: camel_case_types

import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/repsitories/product_repository.dart';

import '../../../core/errors/Failures.dart';
import '../entities/all_products.dart';

class GetAllProductsUseCase {
  final ProductRepository productRepository;
  GetAllProductsUseCase(this.productRepository);
  Future<Either<Failure, AllProducts>> call() async {
    return productRepository.getAllProducts();
  }
}
