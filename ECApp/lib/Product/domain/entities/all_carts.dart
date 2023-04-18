import 'package:ecapp/Product/domain/entities/Cart.dart';
import 'package:equatable/equatable.dart';

class AllCarts extends Equatable {
  final List<Cart> allCarts;
  const AllCarts({required this.allCarts});
  @override
  List<Object?> get props => [allCarts];
}
