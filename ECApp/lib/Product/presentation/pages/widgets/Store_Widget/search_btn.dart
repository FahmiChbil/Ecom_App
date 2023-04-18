import 'package:ecapp/Product/presentation/pages/widgets/Store_Widget/product_search_page.dart';
import 'package:ecapp/core/responsive/models/device_info.dart';
import 'package:flutter/material.dart';

import '../../../../../core/const.dart';

class SearchBtn extends StatelessWidget {
  final DeviceInfo deviceInfo;
  const SearchBtn({
    super.key,
    required this.deviceInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: deviceInfo.orientation == Orientation.portrait
            ? deviceInfo.screenHeight / 20
            : deviceInfo.screenHeight / 15,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: deviceInfo.screenWidth / 2.5),
          child: Container(
            height: 52,
            width: 85,
            decoration: BoxDecoration(
              color: myblack,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: IconButton(
                  color: Colors.white,
                  onPressed: () async {
                    showSearch(
                        context: context,
                        delegate: ProductSeachDelegate(deviceInfo: deviceInfo));
                  },
                  icon: const Icon(Icons.search)),
            ),
          ),
        ));
  }
}
