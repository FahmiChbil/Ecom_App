import 'package:ecapp/Product/presentation/bloc/All_product_bloc/all_product_bloc.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Store_Widget/one_recommendded_product.dart';
import 'package:ecapp/core/responsive/models/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendedProd extends StatelessWidget {
  final DeviceInfo deviceInfo;
  const RecommendedProd({
    super.key,
    required this.deviceInfo,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductBloc, AllProductState>(
      builder: (context, state) {
        if (state is LoadingGetAllProductState) {
          return const CircularProgressIndicator();
        } else if (state is SuccessGetAllProductState) {
          return SizedBox(
            height: deviceInfo.orientation == Orientation.portrait
                ? deviceInfo.screenHeight / 3.4
                : deviceInfo.screenHeight / 3.4,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.allProducts.allProducts.length,
              itemBuilder: (context, index) {
                return OneRecomendedProduct(
                  onTap: () {},
                  ind: index,
                  allProducts: state.allProducts,
                  deviceInfo: deviceInfo,
                );
              },
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
