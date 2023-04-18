// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:ecapp/Product/domain/entities/all_products.dart';
import 'package:ecapp/Product/domain/use_cases/get_all_products_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/Failures.dart';
import '../../../../core/strings/failures.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  AllProductBloc({required this.getAllProductsUseCase})
      : super(AllProductInitial()) {
    on<AllProductEvent>((event, emit) async {
      if (event is GetAllProductEvent) {
        emit(LoadingGetAllProductState());
        final failureOrSucces = await getAllProductsUseCase();
        emit(_mapFailureOrMessageToState(failureOrSucces));
      }
    });
  }
}

AllProductState _mapFailureOrMessageToState(
    Either<Failure, AllProducts> either) {
  return either.fold(
      (failure) =>
          FailedGetAllProductState(message: _mapFailureToMessage(failure)),
      (allProducts) => SuccessGetAllProductState(allProducts: allProducts));
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
