import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/entities/Cart.dart';

import 'package:ecapp/Product/domain/repsitories/product_repository.dart';
import 'package:ecapp/core/errors/Failures.dart';

class AddCartUseCase {
  ProductRepository productRepository;
  AddCartUseCase(this.productRepository);
  Future<Either<Failure, Cart>> call(int userId, List productCartList) async {
    return productRepository.addCart(userId, productCartList);
  }
}
