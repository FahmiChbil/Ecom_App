part of 'search_product_bloc.dart';

abstract class SearchProductEvent extends Equatable {
  const SearchProductEvent();

  @override
  List<Object> get props => [];
}

class BeginSearchProductEvent extends SearchProductEvent {
  final String query;

  const BeginSearchProductEvent({required this.query});
}
