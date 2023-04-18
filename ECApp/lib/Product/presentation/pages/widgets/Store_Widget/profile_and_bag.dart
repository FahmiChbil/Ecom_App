import 'package:ecapp/Product/presentation/pages/Cart_Page.dart';
import 'package:ecapp/core/responsive/models/device_info.dart';
import 'package:flutter/material.dart';

class ProfileAndBag extends StatelessWidget {
  final DeviceInfo deviceInfo;
  const ProfileAndBag({
    required this.deviceInfo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: deviceInfo.screenHeight / 160),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: deviceInfo.screenHeight / 17,
              child: Image.network('https://robohash.org/hicveldicta.png'),
              decoration: const BoxDecoration(shape: BoxShape.circle),
            ),
          ),
          Container(
            height: deviceInfo.screenWidth / 12,
            width: deviceInfo.screenWidth / 12,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Center(
              child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CartPage.id);
                  },
                  icon: Icon(Icons.shopping_bag)),
            ),
          )
        ],
      ),
    );
  }
}
