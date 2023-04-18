import 'package:ecapp/Product/data/models/product_model.dart';
import 'package:ecapp/Product/domain/entities/all_products.dart';

class AllProductModel extends AllProducts {
  const AllProductModel({required super.allProducts});

  factory AllProductModel.fromJson(Map<String, dynamic> json) {
    return AllProductModel(
        allProducts: List.from(json['products'])
            .map((e) => ProductModel.fromJson(e))
            .toList());
  }
}
