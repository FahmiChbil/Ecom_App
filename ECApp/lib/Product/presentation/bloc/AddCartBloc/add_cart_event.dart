// ignore_for_file: must_be_immutable

part of 'add_cart_bloc.dart';

abstract class AddCartEvent extends Equatable {
  const AddCartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends AddCartEvent {
  final int userId;
  final List cartProduct;
  const AddToCartEvent({required this.userId, required this.cartProduct});
}

class AddToSharedEvent extends AddCartEvent {
  int userId;
  int productId;
  AddToSharedEvent({required this.productId, required this.userId});
}
