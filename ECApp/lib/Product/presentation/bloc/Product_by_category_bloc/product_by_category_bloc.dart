// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/entities/all_products.dart';
import 'package:ecapp/Product/domain/use_cases/get_product_by_category_use_case.dart';
import 'package:ecapp/core/strings/failures.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/Failures.dart';

part 'product_by_category_event.dart';
part 'product_by_category_state.dart';

class ProductByCategoryBloc
    extends Bloc<ProductByCategoryEvent, ProductByCategoryState> {
  final GetProductByCategoryUseCase getProductByCategoryUseCase;
  ProductByCategoryBloc({required this.getProductByCategoryUseCase})
      : super(ProductByCategoryInitial()) {
    on<ProductByCategoryEvent>((event, emit) async {
      if (event is GetProductByCategoryEvent) {
        emit(LoadingProductByCategoryState());
        final failureOrSucces =
            await getProductByCategoryUseCase(event.category);
        emit(_mapFailureOrMessageToState(failureOrSucces));
      }
    });
  }
}

ProductByCategoryState _mapFailureOrMessageToState(
    Either<Failure, AllProducts> either) {
  return either.fold(
      (failure) =>
          FailedProductByCategoryState(message: _mapFailureToMessage(failure)),
      (allProducts) => SuccesProductByCategoryState(allProducts: allProducts));
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
