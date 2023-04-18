import 'package:flutter/material.dart';

import '../../../../../core/const.dart';
import '../../../../../core/responsive/models/device_info.dart';

class PromoCode extends StatelessWidget {
  final DeviceInfo deviceInfo;
  const PromoCode({
    super.key,
    required this.deviceInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: deviceInfo.orientation == Orientation.portrait
          ? deviceInfo.screenHeight / 14
          : deviceInfo.screenWidth / 14,
      margin: EdgeInsets.symmetric(
          vertical: deviceInfo.orientation == Orientation.portrait
              ? deviceInfo.screenHeight / 33
              : deviceInfo.screenHeight / 22,
          horizontal: deviceInfo.screenWidth / 18),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            width: 150,
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: "promo Code",
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 112, 194, 194)),
                  border: InputBorder.none),
            ),
          ),
          GestureDetector(
            child: Container(
              width: 100,
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                  color: cartFirstColor,
                  borderRadius: BorderRadius.circular(15)),
              child: const Center(
                child: Text(
                  "Apply",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
