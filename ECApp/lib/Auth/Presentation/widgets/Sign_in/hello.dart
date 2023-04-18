import 'package:flutter/material.dart';

import '../../../../core/const.dart';
import '../../../../core/responsive/ui_conponment/info_widget.dart';

class HelloWidget extends StatelessWidget {
  final String text;
  final double textheight;
  const HelloWidget({
    super.key,
    required this.text,
    required this.textheight,
  });

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Padding(
        padding: EdgeInsets.only(
          left: deviceInfo.orientation == Orientation.portrait
              ? deviceInfo.screenWidth / 14
              : deviceInfo.screenWidth / 15,
        ),
        child: Text(
          text,
          style: TextStyle(
              color: myblack,
              fontWeight: FontWeight.bold,
              fontSize: textheight,
              fontFamily: myFontFamily),
        ),
      );
    });
  }
}
