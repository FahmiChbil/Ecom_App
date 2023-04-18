part of 'add_cart_bloc.dart';

abstract class AddCartState extends Equatable {
  const AddCartState();

  @override
  List<Object> get props => [];
}

class AddCartInitial extends AddCartState {}

class LoadingAddToCartState extends AddCartState {}

class SuccessAddToCartState extends AddCartState {
  final Cart cart;

  const SuccessAddToCartState({required this.cart});
}

class FailedAddToCartState extends AddCartState {
  final String message;
  const FailedAddToCartState({required this.message});
}

class LoadingAddToSharedState extends AddCartState {}

class LoadedAddToSharedState extends AddCartState {
  final List<Map<String, dynamic>> cartList;
  const LoadedAddToSharedState({required this.cartList});
}
