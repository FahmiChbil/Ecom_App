part of 'product_detail_bloc.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

class ProductDetailInitial extends ProductDetailState {}

class LoadingProductDetailState extends ProductDetailState {}

class SuccessProductDetailState extends ProductDetailState {
  final Product product;
  const SuccessProductDetailState({required this.product});
}

class FailedProductDetailState extends ProductDetailState {
  final String message;
  const FailedProductDetailState({required this.message});
}
