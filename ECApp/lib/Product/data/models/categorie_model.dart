import 'package:ecapp/Product/domain/entities/categories.dart';

class CategoriesModel extends Categories {
  const CategoriesModel({required super.allCategories});

  factory CategoriesModel.fromJson(List<String> json) {
    return CategoriesModel(allCategories: json);
  }
}
