// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import 'package:ecapp/Product/domain/use_cases/add_cart_use_case.dart';
import 'package:ecapp/Product/domain/use_cases/cache_values_use_case.dart';
import 'package:ecapp/Product/domain/use_cases/get-cashed_value_use_case.dart';
import 'package:equatable/equatable.dart';

import '../../../../Auth/Domain/entites/User.dart';
import '../../../../core/errors/Failures.dart';
import '../../../../core/strings/failures.dart';
import '../../../domain/entities/Cart.dart';

part 'add_cart_event.dart';
part 'add_cart_state.dart';

class AddCartBloc extends Bloc<AddCartEvent, AddCartState> {
  final AddCartUseCase addCartUseCase;
  final CacheValueUseCase cacheValueUseCase;
  final GetCashedValueUseCase getcashedValueUseCase;

  AddCartBloc(
      {required this.addCartUseCase,
      required this.cacheValueUseCase,
      required this.getcashedValueUseCase})
      : super(AddCartInitial()) {
    on<AddCartEvent>((event, emit) async {
      if (event is AddToSharedEvent) {
        emit(LoadingAddToSharedState());

        await cacheValueUseCase(event.productId);
        final cashedValue = await getcashedValueUseCase();
        emit(LoadedAddToSharedState(cartList: cashedValue));
      }

      if (event is AddToCartEvent) {
        emit(LoadingAddToCartState());
        // final productCart = await getcashedValueUseCase();
        final succesOrfailed =
            await addCartUseCase(event.userId, event.cartProduct);
        emit(_mapFailureOrMessageToState(succesOrfailed));
      }
    });
  }
}

AddCartState _mapFailureOrMessageToState(Either<Failure, Cart> either) {
  return either.fold(
      (failure) => FailedAddToCartState(message: _mapFailureToMessage(failure)),
      (cart) => SuccessAddToCartState(cart: cart));
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
