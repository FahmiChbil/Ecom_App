import 'package:ecapp/Product/presentation/pages/Product_Detail_page.dart';
import 'package:ecapp/core/responsive/models/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../Auth/Domain/entites/User.dart';
import '../../../bloc/Product_by_category_bloc/product_by_category_bloc.dart';
import '../../../bloc/product_Detail_bloc/product_detail_bloc.dart';
import 'one_movie_widget.dart';

class ListOfProduct extends StatelessWidget {
  final DeviceInfo deviceInfo;
  final User user;

  const ListOfProduct({
    required this.deviceInfo,
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProductDetailBloc, ProductDetailState>(
      listener: (context, productDetailState) {
        if (productDetailState is SuccessProductDetailState) {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return ProductDetailPage(
                  user: user, product: productDetailState.product);
            },
          ));
        }
      },
      child: BlocBuilder<ProductByCategoryBloc, ProductByCategoryState>(
        builder: (context, state) {
          if (state is LoadingProductByCategoryState) {
            return const CircularProgressIndicator();
          } else if (state is SuccesProductByCategoryState) {
            return SizedBox(
              height: deviceInfo.orientation == Orientation.portrait
                  ? deviceInfo.screenHeight / 2.8
                  : deviceInfo.screenHeight / 3.4,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.allProducts.allProducts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      BlocProvider.of<ProductDetailBloc>(context).add(
                          GetProductDetailEvent(
                              id: state
                                  .allProducts.allProducts[index].productId));
                    },
                    child: OneProduct(
                      user: user.id!,
                      ind: index,
                      allProducts: state.allProducts,
                      deviceInfo: deviceInfo,
                    ),
                  );
                },
              ),
            );
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
