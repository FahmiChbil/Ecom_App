// ignore_for_file: annotate_overrides

import 'package:ecapp/Product/domain/entities/product..dart';
import 'package:equatable/equatable.dart';

class AllProducts extends Equatable {
  final List<Product> allProducts;
  const AllProducts({required this.allProducts});
  List<Object?> get props => [allProducts];
}
