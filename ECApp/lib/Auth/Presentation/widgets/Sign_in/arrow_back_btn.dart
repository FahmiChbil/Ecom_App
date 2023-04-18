import 'package:flutter/material.dart';

import '../../../../core/responsive/ui_conponment/info_widget.dart';

class ArrowBackBtn extends StatelessWidget {
  final double heigh;
  final double widdth;
  const ArrowBackBtn({
    super.key,
    required this.heigh,
    required this.widdth,
  });

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Container(
        height: heigh,
        width: widdth,
        padding: const EdgeInsets.only(left: 5),
        decoration: const BoxDecoration(
            color: Color.fromRGBO(248, 217, 224, 1),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(4), topRight: Radius.circular(4))),
        child: const Center(child: Icon(Icons.arrow_back_ios)),
      );
    });
  }
}
