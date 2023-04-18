// ignore_for_file: file_names, must_be_immutable

import 'package:ecapp/Product/presentation/pages/widgets/Store_Widget/categories.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Store_Widget/product_search_page.dart';

import 'package:ecapp/Product/presentation/pages/widgets/Store_Widget/profile_and_bag.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Store_Widget/recomended_product.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Store_Widget/search_btn.dart';

import 'package:ecapp/core/const.dart';

import 'package:ecapp/core/responsive/ui_conponment/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Auth/Presentation/bloc/bloc/auth_bloc.dart';
import 'widgets/Store_Widget/list_of_products.dart';

class StorePage extends StatelessWidget {
  StorePage({Key? key}) : super(key: key);
  static String id = "my route";
  List<String> allCategories = [
    "smartphones",
    "laptops",
    "fragrances",
    "skincare",
    "groceries",
    "home-decoration",
    "furniture",
    "tops",
    "womens-dresses",
    "womens-shoes",
    "mens-shirts",
    "mens-shoes",
    "mens-watches",
    "womens-watches",
    "womens-bags",
    "womens-jewellery",
    "sunglasses",
    "automotive",
    "motorcycle",
    "lighting"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is SuccesSignInStat) {
          print(state.user);
          return InfoWidget(
            builder: (context, deviceInfo) {
              // ignore: prefer_const_constructors
              return SafeArea(
                  child: Scaffold(
                body: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 55
                              : deviceInfo.screenHeight / 90,
                        ),
                        ProfileAndBag(deviceInfo: deviceInfo),
                        SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 45
                              : deviceInfo.screenHeight / 90,
                        ),
                        MyCategoris(
                            deviceInfo: deviceInfo,
                            allCategories: allCategories),
                        SizedBox(
                          height: deviceInfo.screenHeight / 40,
                        ),
                        ListOfProduct(
                          user: state.user,
                          deviceInfo: deviceInfo,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: deviceInfo.screenHeight / 40),
                          child: Text(
                            'Recommended For You',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: myblack,
                                fontFamily: 'Calvin-Medium',
                                fontSize: deviceInfo.orientation ==
                                        Orientation.portrait
                                    ? deviceInfo.screenHeight / 45
                                    : deviceInfo.screenHeight / 29),
                          ),
                        ),
                        SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 120
                              : deviceInfo.screenHeight / 60,
                        ),
                        RecommendedProd(
                          deviceInfo: deviceInfo,
                        )
                      ],
                    ),
                    SearchBtn(
                      deviceInfo: deviceInfo,
                    )
                    // SearchBtn(
                    //   deviceInfo: deviceInfo,
                    // )
                  ],
                ),
              ));
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
