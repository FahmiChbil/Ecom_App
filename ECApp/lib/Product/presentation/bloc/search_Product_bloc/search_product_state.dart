part of 'search_product_bloc.dart';

abstract class SearchProductState extends Equatable {
  const SearchProductState();

  @override
  List<Object> get props => [];
}

class SearchProductInitial extends SearchProductState {}

class LoadingSearchProductState extends SearchProductState {}

class SuccessSearchProductState extends SearchProductState {
  final AllProducts allProducts;

  const SuccessSearchProductState({required this.allProducts});
}

class FailedSearchproductState extends SearchProductState {
  final String message;

  const FailedSearchproductState({required this.message});
}
