part of 'all_product_bloc.dart';

abstract class AllProductState extends Equatable {
  const AllProductState();

  @override
  List<Object> get props => [];
}

class AllProductInitial extends AllProductState {}

class LoadingGetAllProductState extends AllProductState {}

class SuccessGetAllProductState extends AllProductState {
  final AllProducts allProducts;

  const SuccessGetAllProductState({required this.allProducts});
}

class FailedGetAllProductState extends AllProductState {
  final String message;
  const FailedGetAllProductState({required this.message});
}
