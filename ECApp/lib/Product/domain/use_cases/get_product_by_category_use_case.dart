import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/repsitories/product_repository.dart';

import '../../../core/errors/Failures.dart';
import '../entities/all_products.dart';

class GetProductByCategoryUseCase {
  final ProductRepository productRepository;
  GetProductByCategoryUseCase(this.productRepository);
  Future<Either<Failure, AllProducts>> call(String category) async {
    return await productRepository.getProductByCategories(category);
  }
}
