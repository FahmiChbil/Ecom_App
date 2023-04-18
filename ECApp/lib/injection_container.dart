import 'package:ecapp/Auth/Data/datasources/Auth_remote_data_source.dart';
import 'package:ecapp/Auth/Data/repositories/auth_repository_impl.dart';
import 'package:ecapp/Auth/Domain/UseCases/Sign_In_Use_Case.dart';

import 'package:ecapp/Auth/Domain/repositories/AuthRepositorie.dart';
import 'package:ecapp/Auth/Presentation/bloc/bloc/auth_bloc.dart';
import 'package:ecapp/Product/data/datasources.dart/product_local_data_source.dart';
import 'package:ecapp/Product/data/datasources.dart/product_remote_data_source.dart';
import 'package:ecapp/Product/data/repositories/product_repository_impl.dart';
import 'package:ecapp/Product/domain/repsitories/product_repository.dart';
import 'package:ecapp/Product/domain/use_cases/add_cart_use_case.dart';
import 'package:ecapp/Product/domain/use_cases/get-cashed_value_use_case.dart';
import 'package:ecapp/Product/domain/use_cases/get_all_products_use_case.dart';
import 'package:ecapp/Product/domain/use_cases/get_product_by_category_use_case.dart';
import 'package:ecapp/Product/domain/use_cases/get_single_product_use_case.dart';
import 'package:ecapp/Product/domain/use_cases/search_product_use_case.dart';

import 'package:ecapp/Product/presentation/bloc/All_product_bloc/all_product_bloc.dart';
import 'package:ecapp/Product/presentation/bloc/Product_by_category_bloc/product_by_category_bloc.dart';
import 'package:ecapp/Product/presentation/bloc/product_Detail_bloc/product_detail_bloc.dart';
import 'package:ecapp/Product/presentation/bloc/search_Product_bloc/search_product_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart ' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Auth/Domain/UseCases/Sign_up_useCase.dart';
import 'Product/domain/use_cases/cache_values_use_case.dart';
import 'Product/presentation/bloc/AddCartBloc/add_cart_bloc.dart';
import 'core/Network/Neetwork_info.dart';

final sl = GetIt.instance;

Future<void> init() async {
// !Features Auth

//Bloc
  sl.registerFactory(() => AuthBloc(signInUseCase: sl(), signUpUseCase: sl()));
  sl.registerFactory(
      () => ProductByCategoryBloc(getProductByCategoryUseCase: sl()));
  sl.registerFactory(() => AllProductBloc(getAllProductsUseCase: sl()));
  sl.registerFactory(() => SearchProductBloc(searchProductUseCase: sl()));
  sl.registerFactory(() => ProductDetailBloc(getSingleProductUseCase: sl()));
  sl.registerFactory(() => AddCartBloc(
      addCartUseCase: sl(),
      cacheValueUseCase: sl(),
      getcashedValueUseCase: sl()));

//usecases
  sl.registerLazySingleton(() => GetProductByCategoryUseCase(sl()));
  sl.registerLazySingleton(() => SignInUseCase(sl()));
  sl.registerLazySingleton(() => SignUpUseCase(sl()));
  sl.registerLazySingleton(() => GetAllProductsUseCase(sl()));
  sl.registerLazySingleton(() => SearchProductUseCase(sl()));
  sl.registerLazySingleton(() => GetSingleProductUseCase(sl()));
  sl.registerLazySingleton(() => AddCartUseCase(sl()));
  sl.registerLazySingleton(() => CacheValueUseCase(sl()));
  sl.registerLazySingleton(() => GetCashedValueUseCase(sl()));

//repository
  sl.registerLazySingleton<AuthRepository>(() =>
      AuthRepositoryImpl(authRemoteDataSourceImpl: sl(), networkInfo: sl()));
  sl.registerLazySingleton<ProductRepository>(() => ProductRepositoryImpl(
      productLocalDataSourceImpl: sl(),
      productRemoteDataSouceImpl: sl(),
      networkInfo: sl()));
//DataSources
  sl.registerLazySingleton(() => AuthRemoteDataSourceImpl());
  sl.registerLazySingleton(() => ProductRemoteDataSouceImpl());
  sl.registerLazySingleton(
      () => ProductLocalDataSourceImpl(sharedPreferences: sl()));
  // Core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  SharedPreferences.setMockInitialValues({});
  final sharedPreferences = await SharedPreferences.getInstance();

  // external
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
