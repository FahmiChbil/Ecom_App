// ignore_for_file: file_names

import 'package:ecapp/Product/presentation/pages/widgets/Cart_wdgets/Custom_app__bar.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Cart_wdgets/one_product_cart.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Cart_wdgets/promo_code.dart';
import 'package:ecapp/core/const.dart';

import 'package:ecapp/core/responsive/ui_conponment/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/AddCartBloc/add_cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);
  static String id = "myroute";

  @override
  Widget build(BuildContext context) {
    TextEditingController textControler = TextEditingController();
    return BlocBuilder<AddCartBloc, AddCartState>(
      builder: (context, state) {
        if (state is SuccessAddToCartState) {
          return InfoWidget(builder: (context, deviceInfo) {
            return SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Scaffold(
                  backgroundColor: cartBackgroundColor,
                  body: Column(
                    children: [
                      CustomAppBar(
                        productsNumber: state.cart.products.length,
                        deviceInfo: deviceInfo,
                      ),
                      Container(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 3
                              : deviceInfo.screenWidth / 7,
                          child: ListView(
                            children: [
                              ...List.generate(
                                  state.cart.products.length,
                                  (index) => OneProductCart(
                                        productName:
                                            state.cart.products[index].title,
                                        productPrice:
                                            state.cart.products[index].price,
                                        deviceInfo: deviceInfo,
                                      )),
                            ],
                          )),
                      PromoCode(
                        deviceInfo: deviceInfo,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: deviceInfo.screenWidth / 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "bag Total",
                              style: TextStyle(
                                  fontFamily: cartFontFamily,
                                  fontSize: deviceInfo.orientation ==
                                          Orientation.portrait
                                      ? deviceInfo.screenHeight / 45
                                      : deviceInfo.screenWidth / 45),
                            ),
                            Text(
                              "${state.cart.totale.toString()}\$",
                              style: TextStyle(
                                  fontFamily: cartFontFamily,
                                  fontSize: deviceInfo.orientation ==
                                          Orientation.portrait
                                      ? deviceInfo.screenHeight / 45
                                      : deviceInfo.screenWidth / 45),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
        } else {
          return Container(
            child: Text("hola"),
          );
        }
      },
    );
  }
}
