// ignore_for_file: file_names

import 'package:ecapp/Product/data/models/Product_cart_model.dart';
import 'package:ecapp/Product/domain/entities/Cart.dart';

class CartModel extends Cart {
  const CartModel(
      {required super.cartId,
      required super.products,
      required super.totale,
      required super.userId,
      required super.totaleProducts});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
        cartId: json['id'],
        products: List.from(json['products'])
            .map((e) => ProductCartModel.fromJson(e))
            .toList(),
        totale: json['total'],
        userId: json['userId'],
        totaleProducts: json['totalProducts']);
  }
  Map<String, dynamic> toJson(ProductCartModel productCartModel) {
    return {
      'userId': userId,
      'products': [
        {
          'id': productCartModel.productId,
          'quantity': productCartModel.quantity,
        }
      ]
    };
  }
}
