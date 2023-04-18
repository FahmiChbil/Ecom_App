// ignore_for_file: annotate_overrides

import 'package:equatable/equatable.dart';

class ProductCart extends Equatable {
  final int productId;
  final String title;
  final int price;
  final int quantity;
  final int totale;
  const ProductCart(
      {required this.productId,
      required this.title,
      required this.price,
      required this.quantity,
      required this.totale});
  List<Object?> get props => [productId, title, price, totale, quantity];
}
