// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/entities/product..dart';
import 'package:ecapp/Product/domain/use_cases/get_single_product_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/strings/failures.dart';

part 'product_detail_event.dart';
part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  GetSingleProductUseCase getSingleProductUseCase;
  ProductDetailBloc({required this.getSingleProductUseCase})
      : super(ProductDetailInitial()) {
    on<ProductDetailEvent>((event, emit) async {
      if (event is GetProductDetailEvent) {
        emit(LoadingProductDetailState());
        final productOrFailure = await getSingleProductUseCase(event.id);
        emit(_mapFailureOrMessageToState(productOrFailure));
      }
    });
  }
}

ProductDetailState _mapFailureOrMessageToState(
    Either<Failure, Product> either) {
  return either.fold(
      (failure) =>
          FailedProductDetailState(message: _mapFailureToMessage(failure)),
      (product) => SuccessProductDetailState(product: product));
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
