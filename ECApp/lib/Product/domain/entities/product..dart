// ignore_for_file: file_names

import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int productId;
  final String title;
  final String description;
  final int price;
  final String brand;
  final String category;
  final String thumbnail;
  final List<dynamic> images;

  const Product(
      {required this.productId,
      required this.title,
      required this.description,
      required this.price,
      required this.brand,
      required this.category,
      required this.thumbnail,
      required this.images});

  @override
  List<Object?> get props => [
        productId,
        title,
        description,
        price,
        brand,
        category,
        thumbnail,
        images
      ];
}
