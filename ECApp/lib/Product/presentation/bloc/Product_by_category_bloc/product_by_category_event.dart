part of 'product_by_category_bloc.dart';

abstract class ProductByCategoryEvent extends Equatable {
  const ProductByCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetProductByCategoryEvent extends ProductByCategoryEvent {
  final String category;

  const GetProductByCategoryEvent({required this.category});
}
