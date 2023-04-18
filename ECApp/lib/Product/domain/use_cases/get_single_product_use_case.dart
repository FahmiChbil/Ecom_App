import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/entities/product..dart';
import 'package:ecapp/Product/domain/repsitories/product_repository.dart';

import '../../../core/errors/Failures.dart';

class GetSingleProductUseCase {
  final ProductRepository productRepository;
  GetSingleProductUseCase(this.productRepository);

  Future<Either<Failure, Product>> call(int productId) async {
    return productRepository.getSingleProduct(productId);
  }
}
