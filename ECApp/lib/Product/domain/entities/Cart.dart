// ignore_for_file: file_names, annotate_overrides

import 'package:ecapp/Product/domain/entities/product_cart.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final int cartId;
  final List<ProductCart> products;
  final int totale;
  final int? userId;
  final int totaleProducts;

  const Cart(
      {required this.cartId,
      required this.products,
      required this.totale,
      required this.userId,
      required this.totaleProducts});
  List<Object?> get props => [cartId, products, totale, userId, totaleProducts];
}
