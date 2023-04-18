// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/entities/all_products.dart';
import 'package:ecapp/Product/domain/use_cases/search_product_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/strings/failures.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchProductBloc extends Bloc<SearchProductEvent, SearchProductState> {
  final SearchProductUseCase searchProductUseCase;

  SearchProductBloc({required this.searchProductUseCase})
      : super(SearchProductInitial()) {
    on<SearchProductEvent>((event, emit) async {
      if (event is BeginSearchProductEvent) {
        emit(LoadingSearchProductState());
        final result = await searchProductUseCase(event.query);
        emit(_mapFailureOrMessageToState(result));
      }
    });
  }
}

SearchProductState _mapFailureOrMessageToState(
    Either<Failure, AllProducts> either) {
  return either.fold(
      (failure) =>
          FailedSearchproductState(message: _mapFailureToMessage(failure)),
      (allProducts) => SuccessSearchProductState(allProducts: allProducts));
}

String _mapFailureToMessage(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return SERVER_FAILURE_MESSAGE;

    case OfflinFailure:
      return OFFLINE_FAILURE_MESSAGE;

    default:
      return 'unexpected error , please try later ';
  }
}
