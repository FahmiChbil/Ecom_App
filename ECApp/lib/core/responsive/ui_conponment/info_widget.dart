import 'package:flutter/material.dart';

import '../functions/get_device_type.dart';
import '../models/device_info.dart';

// ignore: must_be_immutable
class InfoWidget extends StatelessWidget {
  Widget Function(BuildContext, DeviceInfo) builder;
  InfoWidget({Key? key, required this.builder}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var mediaQueryData = MediaQuery.of(context);
      var deviceInfo = DeviceInfo(
          orientation: mediaQueryData.orientation,
          deviceType: getDeviceType(mediaQueryData),
          screenHeight: mediaQueryData.size.height,
          screenWidth: mediaQueryData.size.width,
          localHeight: constraints.maxHeight,
          localWidth: constraints.maxWidth);
      return builder(context, deviceInfo);
    });
  }
}
