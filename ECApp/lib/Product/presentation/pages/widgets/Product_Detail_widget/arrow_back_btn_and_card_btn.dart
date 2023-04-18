import 'package:ecapp/core/responsive/models/device_info.dart';
import 'package:flutter/material.dart';

class ArrowBackBtnAndCardBtn extends StatelessWidget {
  final DeviceInfo deviceInfo;
  final int counter;
  final void Function()? onPress;
  final void Function()? onPress1;
  const ArrowBackBtnAndCardBtn({
    super.key,
    required this.deviceInfo,
    required this.counter,
    required this.onPress,
    required this.onPress1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: deviceInfo.screenWidth / 23,
          right: deviceInfo.screenWidth / 23,
          top: deviceInfo.screenHeight / 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: onPress1,
              icon: const Icon(
                Icons.arrow_back_ios_new,
              )),
          Stack(
            children: [
              IconButton(
                  onPressed: onPress,
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: Colors.black,
                    size: 30,
                  )),
              Positioned(
                  right: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          counter.toString(),
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        )),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
