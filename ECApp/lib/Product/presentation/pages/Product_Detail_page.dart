// ignore_for_file: non_constant_identifier_names

import 'package:ecapp/Product/domain/entities/product..dart';
import 'package:ecapp/Product/presentation/bloc/AddCartBloc/add_cart_bloc.dart';
import 'package:ecapp/Product/presentation/pages/Cart_Page.dart';
import 'package:ecapp/Product/presentation/pages/Store_page.dart';

import 'package:ecapp/Product/presentation/pages/widgets/Product_Detail_widget/arrow_back_btn_and_card_btn.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Product_Detail_widget/image_number.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Product_Detail_widget/product_images.dart';
import 'package:ecapp/core/const.dart';

import 'package:ecapp/core/responsive/ui_conponment/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Auth/Domain/entites/User.dart';

class ProductDetailPage extends StatefulWidget {
  final User user;

  const ProductDetailPage({Key? key, required this.product, required this.user})
      : super(key: key);

  static String id = "prduct Detail Route";
  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with RestorationMixin {
  RestorableInt counter = RestorableInt(0);
  int pageIndex = 0;
  static Route<int> StorePageNavigation(context, arguments) =>
      MaterialPageRoute<int>(
        builder: (context) => StorePage(),
      );

  @override
  Widget build(BuildContext context) {
    List cardList = [];

    return InfoWidget(
      builder: (context, devicInfo) {
        return SafeArea(
            child: Scaffold(
          body: Stack(
            children: [
              Container(
                color: detailPageBackground,
              ),
              InfoWidget(builder: (context, deviceInfo) {
                return Container(
                    height: deviceInfo.screenHeight,
                    width: deviceInfo.screenWidth,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                      color: firstPage,
                    ),
                    margin: const EdgeInsets.all(10),
                    child: BlocConsumer<AddCartBloc, AddCartState>(
                      listener: (context, state) {
                        if (state is LoadedAddToSharedState) {
                          counter.value++;
                          cardList.add(state.cartList);
                        }

                        if (state is SuccessAddToCartState) {
                          Navigator.pushNamed(context, CartPage.id);
                        }
                      },
                      builder: (context, state) {
                        return Column(
                          children: [
                            ArrowBackBtnAndCardBtn(
                              onPress1: () {
                                Navigator.restorablePush(
                                    context, StorePageNavigation);
                              },
                              deviceInfo: deviceInfo,
                              counter: counter.value,
                              onPress: () {
                                print(cardList);
                                if (cardList.isEmpty) {
                                  Navigator.pushNamed(context, CartPage.id);
                                } else {
                                  BlocProvider.of<AddCartBloc>(context).add(
                                      AddToCartEvent(
                                          userId: widget.user.id!,
                                          cartProduct: cardList[0]));
                                }
                              },
                            ),
                            Stack(
                              children: [
                                productImages(
                                  userId: widget.user.id!,
                                  product: widget.product,
                                  devicInfo: deviceInfo,
                                ),
                                ImageNumber(pageIndex: pageIndex)
                              ],
                            ),
                          ],
                        );
                      },
                    ));
              })
            ],
          ),
        ));
      },
    );
  }

  @override
  String? get restorationId => "product_detail_id";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(counter, "counter_id");

    void _incrementCounter() {
      counter.value++;
      setState(() {});
    }
  }

  void dispose() {
    super.dispose();
    counter.dispose();
  }
}





                      //     BlocConsumer<AddCartBloc, AddCartState>(
                      //   builder: (context, state) {
                      //     if (state is AddedToListState) {
                      //       return 
                      //     }
                         
                      //     return ArrowBackBtnAndCardBtn(
                      //         deviceInfo: deviceInfo, counter: 0);
                      //   },
                      //   listener: (context, state) {
                          
                      //   },
                      // ),