// ignore_for_file: file_names

import 'package:ecapp/Product/domain/repsitories/product_repository.dart';

class GetCashedValueUseCase {
  ProductRepository productRepository;
  GetCashedValueUseCase(this.productRepository);
  Future<List<Map<String, dynamic>>> call() {
    return productRepository.getCachedvalue();
  }
}
