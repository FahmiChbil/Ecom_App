import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/repsitories/product_repository.dart';

import '../../../core/errors/Failures.dart';
import '../entities/categories.dart';

class GetAllCategoriesUseCase {
  final ProductRepository productRepository;
  GetAllCategoriesUseCase(this.productRepository);

  Future<Either<Failure, Categories>> call() async {
    return productRepository.getAllCategories();
  }
}
