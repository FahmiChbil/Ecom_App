import 'package:flutter/material.dart';

import '../../../../../core/const.dart';
import '../../../../../core/responsive/models/device_info.dart';

class OneProductCart extends StatelessWidget {
  final DeviceInfo deviceInfo;
  final String productName;
  final int productPrice;
  const OneProductCart({
    super.key,
    required this.deviceInfo,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceInfo.screenWidth / 18),
      child: Container(
        height: deviceInfo.orientation == Orientation.portrait
            ? deviceInfo.screenHeight / 8
            : deviceInfo.screenWidth / 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: deviceInfo.orientation == Orientation.portrait ? 1 : 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                    height: deviceInfo.orientation == Orientation.portrait
                        ? deviceInfo.screenHeight / 12
                        : deviceInfo.screenWidth / 12,
                    width: deviceInfo.orientation == Orientation.portrait
                        ? deviceInfo.screenHeight / 12
                        : deviceInfo.screenWidth / 12,
                    child: Image.network(
                      'https://i.dummyjson.com/data/products/1/1.jpg',
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Expanded(
              flex: deviceInfo.orientation == Orientation.portrait ? 3 : 6,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height: deviceInfo.orientation == Orientation.portrait
                    ? deviceInfo.screenHeight / 14
                    : deviceInfo.screenWidth / 14,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      maxLines: 1,
                      style: TextStyle(
                          fontFamily: 'NoyhR',
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      child: Text(
                        "${productPrice.toString()}\$",
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'NoyhR',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: deviceInfo.orientation == Orientation.portrait
                    ? deviceInfo.screenHeight / 30
                    : deviceInfo.screenWidth / 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      child: Container(
                        height: deviceInfo.orientation == Orientation.portrait
                            ? deviceInfo.screenHeight / 30
                            : deviceInfo.screenWidth / 30,
                        width: deviceInfo.orientation == Orientation.portrait
                            ? deviceInfo.screenHeight / 30
                            : deviceInfo.screenWidth / 30,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: cartBackgroundColor,
                            shape: BoxShape.circle),
                        child: Center(
                          child: Icon(
                            Icons.remove,
                            size: 15,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "02",
                      style: TextStyle(
                          fontFamily: cartFontFamily, color: Colors.black),
                    ),
                    GestureDetector(
                        child: Container(
                      height: deviceInfo.orientation == Orientation.portrait
                          ? deviceInfo.screenHeight / 30
                          : deviceInfo.screenWidth / 30,
                      width: deviceInfo.orientation == Orientation.portrait
                          ? deviceInfo.screenHeight / 30
                          : deviceInfo.screenWidth / 30,
                      decoration: BoxDecoration(
                          color: Colors.black, shape: BoxShape.circle),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
