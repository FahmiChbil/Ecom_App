part of 'product_by_category_bloc.dart';

abstract class ProductByCategoryState extends Equatable {
  const ProductByCategoryState();

  @override
  List<Object> get props => [];
}

class ProductByCategoryInitial extends ProductByCategoryState {}

class LoadingProductByCategoryState extends ProductByCategoryState {}

class SuccesProductByCategoryState extends ProductByCategoryState {
  final AllProducts allProducts;
  const SuccesProductByCategoryState({required this.allProducts});
}

class FailedProductByCategoryState extends ProductByCategoryState {
  final String message;

  const FailedProductByCategoryState({required this.message});
}
