import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  final List<String> allCategories;
  const Categories({required this.allCategories});
  @override
  List<Object?> get props => [allCategories];
}
