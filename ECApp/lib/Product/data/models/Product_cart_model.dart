// ignore_for_file: file_names

import 'package:ecapp/Product/domain/entities/product_cart.dart';

class ProductCartModel extends ProductCart {
  const ProductCartModel(
      {required super.productId,
      required super.title,
      required super.price,
      required super.quantity,
      required super.totale});

  factory ProductCartModel.fromJson(Map<String, dynamic> json) {
    return ProductCartModel(
        productId: json['id'],
        title: json['title'],
        price: json['price'],
        quantity: json['quantity'],
        totale: json['total']);
  }

  Map<String, dynamic> toJson(int productid) {
    return {
      "id": productid,
      "quantity": 1,
    };
  }
}
