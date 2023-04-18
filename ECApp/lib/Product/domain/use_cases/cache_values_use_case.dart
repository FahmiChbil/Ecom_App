import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/repsitories/product_repository.dart';

import '../../../core/errors/Failures.dart';

class CacheValueUseCase {
  ProductRepository productRepository;
  CacheValueUseCase(this.productRepository);
  Future<Either<Failure, Unit>> call(int productId) async {
    return productRepository.cacheValue(productId);
  }
}
