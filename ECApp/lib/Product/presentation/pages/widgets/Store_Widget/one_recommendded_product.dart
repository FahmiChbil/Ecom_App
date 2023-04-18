import 'package:flutter/material.dart';

import '../../../../../core/responsive/models/device_info.dart';
import '../../../../domain/entities/all_products.dart';

class OneRecomendedProduct extends StatelessWidget {
  final DeviceInfo deviceInfo;
  final AllProducts allProducts;
  final int ind;
  void Function()? onTap;
  OneRecomendedProduct(
      {Key? key,
      required this.deviceInfo,
      required this.allProducts,
      required this.ind,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: deviceInfo.screenHeight / 40),
      child: SizedBox(
        width: deviceInfo.orientation == Orientation.portrait
            ? deviceInfo.screenWidth / 2.4
            : deviceInfo.screenWidth / 3,
        height: deviceInfo.orientation == Orientation.portrait
            ? deviceInfo.screenHeight / 7
            : deviceInfo.screenHeight / 5,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.brown.shade100,
                    image: DecorationImage(
                        image: NetworkImage(
                          allProducts.allProducts[ind].thumbnail,
                        ),
                        fit: BoxFit.cover)),
              ),
            )),
      ),
    );
  }
}
