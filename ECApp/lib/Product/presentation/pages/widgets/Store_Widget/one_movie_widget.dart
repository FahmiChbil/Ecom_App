import 'package:ecapp/Product/domain/entities/all_products.dart';
import 'package:ecapp/Product/presentation/pages/widgets/Store_Widget/one_recommendded_product.dart';

import 'package:flutter/material.dart';

import '../../../../../core/responsive/models/device_info.dart';

class OneProduct extends StatelessWidget {
  final int user;
  final AllProducts allProducts;
  final int ind;
  final DeviceInfo deviceInfo;

  const OneProduct({
    super.key,
    required this.deviceInfo,
    required this.allProducts,
    required this.ind,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: deviceInfo.orientation == Orientation.portrait
          ? deviceInfo.screenHeight / 3.7
          : deviceInfo.screenHeight / 6,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: OneRecomendedProduct(
                onTap: () {},
                deviceInfo: deviceInfo,
                allProducts: allProducts,
                ind: ind),
          ),
          Padding(
            padding: EdgeInsets.only(left: deviceInfo.screenHeight / 40),
            child: SizedBox(
              width: deviceInfo.orientation == Orientation.portrait
                  ? deviceInfo.screenWidth / 2.7
                  : deviceInfo.screenWidth / 3,
              height: deviceInfo.orientation == Orientation.portrait
                  ? deviceInfo.screenHeight / 17
                  : deviceInfo.screenHeight / 11,
              child: Container(
                child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                    leading: Container(
                        width: deviceInfo.orientation == Orientation.portrait
                            ? deviceInfo.localWidth / 4
                            : deviceInfo.localWidth / 7,
                        child: Text(
                          allProducts.allProducts[ind].title,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Calvin-Medium'),
                        )),
                    trailing: Container(
                      height: deviceInfo.orientation == Orientation.portrait
                          ? deviceInfo.screenHeight / 30
                          : deviceInfo.screenWidth / 17,
                      child: Text(
                        "${allProducts.allProducts[ind].price}\$",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Lionel Text Steam'),
                      ),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
