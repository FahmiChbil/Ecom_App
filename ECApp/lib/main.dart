// ignore_for_file: file_names
import 'package:device_preview/device_preview.dart';

import 'package:ecapp/Auth/Presentation/pages/Sign_up.dart';
import 'package:ecapp/Auth/Presentation/pages/User_page.dart';
import 'package:ecapp/Auth/Presentation/widgets/Sign_in/failed_sign_in.dart';
import 'package:ecapp/Product/data/datasources.dart/db/mongo_db.dart';

import 'package:ecapp/Product/presentation/bloc/All_product_bloc/all_product_bloc.dart';
import 'package:ecapp/Product/presentation/bloc/Product_by_category_bloc/product_by_category_bloc.dart';
import 'package:ecapp/Product/presentation/bloc/product_Detail_bloc/product_detail_bloc.dart';
import 'package:ecapp/Product/presentation/bloc/search_Product_bloc/search_product_bloc.dart';
import 'package:ecapp/Product/presentation/pages/Cart_Page.dart';

import 'package:ecapp/Product/presentation/pages/Store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Auth/Presentation/bloc/bloc/auth_bloc.dart';

import 'Auth/Presentation/pages/Sign_in_page.dart';
import 'Product/presentation/bloc/AddCartBloc/add_cart_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  await MongoDataBase.connect();

  runApp(DevicePreview(
    builder: (context) => const MaterialApp(
      restorationScopeId: "route",
      useInheritedMediaQuery: true,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<AddCartBloc>(),
        ),
        BlocProvider(create: (context) => di.sl<ProductDetailBloc>()),
        BlocProvider(
          create: (context) => di.sl<SearchProductBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<AuthBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<ProductByCategoryBloc>(),
        ),
        BlocProvider(
          create: (context) => di.sl<AllProductBloc>(),
        )
      ],
      child: MaterialApp(
          builder: DevicePreview.appBuilder,
          routes: {
            CartPage.id: (context) => CartPage(),
            StorePage.id: (context) => StorePage(),
            'user': (context) => const UserPage(),
            FailedSignIn.myroute: (context) => const FailedSignIn(),
            SignUp.id: (context) => const SignUp(),
          },
          useInheritedMediaQuery: true,
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: SignInPage()),
    );
  }
}
