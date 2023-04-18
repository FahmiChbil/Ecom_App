import 'package:ecapp/Product/presentation/pages/Store_page.dart';
import 'package:flutter/material.dart';

import '../../../../../core/const.dart';
import '../../../../../core/responsive/models/device_info.dart';

class CustomAppBar extends StatelessWidget {
  final int productsNumber;
  final DeviceInfo deviceInfo;
  const CustomAppBar({
    super.key,
    required this.deviceInfo,
    required this.productsNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: deviceInfo.screenHeight / 26,
          horizontal: deviceInfo.screenWidth / 18),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StorePage(),
                      ));
                },
                icon: Icon(Icons.arrow_back_ios_new)),
            Text(
              "Shopping Bag",
              style: TextStyle(
                  fontFamily: cartFontFamily,
                  fontSize: deviceInfo.screenWidth / 21),
            ),
            Container(
                height: deviceInfo.screenWidth / 12,
                width: deviceInfo.screenWidth / 12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Center(
                      child: Icon(Icons.lock),
                    ),
                    Positioned(
                        right: -5,
                        top: -5,
                        child: Container(
                          height: deviceInfo.screenWidth / 25,
                          width: deviceInfo.screenWidth / 25,
                          decoration: BoxDecoration(
                              color: Colors.black, shape: BoxShape.circle),
                          child: Center(
                            child: Text(
                              "${productsNumber.toString()}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
