part of 'all_product_bloc.dart';

abstract class AllProductEvent extends Equatable {
  const AllProductEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductEvent extends AllProductEvent {}
