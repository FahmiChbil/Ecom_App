part of 'product_detail_bloc.dart';

abstract class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

class GetProductDetailEvent extends ProductDetailEvent {
  final int id;
  const GetProductDetailEvent({required this.id});
}
