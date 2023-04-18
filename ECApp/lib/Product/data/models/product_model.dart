import 'package:ecapp/Product/domain/entities/product..dart';

class ProductModel extends Product {
  const ProductModel(
      {required super.productId,
      required super.title,
      required super.description,
      required super.price,
      required super.brand,
      required super.category,
      required super.thumbnail,
      required super.images});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        productId: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        brand: json['brand'],
        category: json['category'],
        thumbnail: json['thumbnail'],
        images: json['images']);
  }
}
