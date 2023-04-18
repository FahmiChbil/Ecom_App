import 'package:flutter/material.dart';

import '../enums/device_types.dart';

class DeviceInfo {
  final Orientation orientation;
  final DeviceType deviceType;
  final double screenWidth;
  final double screenHeight;
  final double localHeight;
  final double localWidth;
  DeviceInfo(
      {required this.orientation,
      required this.deviceType,
      required this.screenHeight,
      required this.screenWidth,
      required this.localHeight,
      required this.localWidth});
}
