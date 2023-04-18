import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/repsitories/product_repository.dart';

import '../../../core/errors/Failures.dart';
import '../entities/all_products.dart';

class SearchProductUseCase {
  final ProductRepository productRepository;
  SearchProductUseCase(this.productRepository);

  Future<Either<Failure, AllProducts>> call(String query) async {
    return productRepository.searchProduct(query);
  }
}
