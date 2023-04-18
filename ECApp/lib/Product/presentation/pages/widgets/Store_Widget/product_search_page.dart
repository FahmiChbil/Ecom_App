import 'package:ecapp/Auth/Domain/entites/User.dart';
import 'package:ecapp/Product/presentation/pages/Product_Detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/responsive/models/device_info.dart';
import '../../../bloc/search_Product_bloc/search_product_bloc.dart';
import 'one_recommendded_product.dart';

class ProductSeachDelegate extends SearchDelegate {
  final DeviceInfo deviceInfo;
  User user = const User(
      id: 1,
      firstName: "",
      lastName: "",
      username: "",
      password: "",
      email: "",
      image: "",
      token: "");

  ProductSeachDelegate({required this.deviceInfo});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close)),
      IconButton(
          onPressed: () {
            BlocProvider.of<SearchProductBloc>(context)
                .add(BeginSearchProductEvent(query: query));
            showResults(context);
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.navigate_before));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<SearchProductBloc, SearchProductState>(
      builder: (context, state) {
        if (state is LoadingSearchProductState) {
          return const SizedBox();
        } else if (state is SuccessSearchProductState) {
          return OrientationBuilder(
            builder: (context, orientation) => orientation ==
                    Orientation.portrait
                ? GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          orientation == Orientation.portrait ? 2 : 4,
                    ),
                    itemCount: state.allProducts.allProducts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OneRecomendedProduct(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductDetailPage(
                                            product: state
                                                .allProducts.allProducts[index],
                                            user: user),
                                      ));
                                },
                                deviceInfo: deviceInfo,
                                allProducts: state.allProducts,
                                ind: index),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: deviceInfo.orientation ==
                                          Orientation.portrait
                                      ? deviceInfo.screenHeight / 40
                                      : deviceInfo.screenWidth / 35),
                              child: SizedBox(
                                width: orientation == Orientation.portrait
                                    ? deviceInfo.screenWidth / 2.7
                                    : deviceInfo.screenWidth / 8,
                                height: orientation == Orientation.portrait
                                    ? deviceInfo.screenHeight / 20
                                    : deviceInfo.screenHeight / 15,
                                child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                    leading: SizedBox(
                                        width: deviceInfo.localWidth / 4,
                                        child: Text(
                                          state.allProducts.allProducts[index]
                                              .title,
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'Calvin-Medium'),
                                        )),
                                    trailing: SizedBox(
                                      child: Text(
                                        state.allProducts.allProducts[index]
                                            .price
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Lionel Text Steam'),
                                      ),
                                    )),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )
                : Container(
                    color: Colors.red,
                  ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox();
  }
}
