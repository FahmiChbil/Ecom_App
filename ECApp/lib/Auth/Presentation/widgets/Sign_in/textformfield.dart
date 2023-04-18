// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../core/responsive/ui_conponment/info_widget.dart';

class TextformField extends StatelessWidget {
  final String muHint;
  final bool obsucure;

  bool isvalid = true;
  TextEditingController controllerText = TextEditingController();

  TextformField(
      {Key? key,
      required this.muHint,
      required this.controllerText,
      required this.obsucure})
      : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: deviceInfo.orientation == Orientation.portrait
              ? deviceInfo.screenWidth / 40
              : deviceInfo.screenWidth / 20,
        ),
        child: Material(
          elevation: 7,
          borderRadius: BorderRadius.circular(10),
          child: TextFormField(
            obscureText: obsucure,
            controller: controllerText,
            validator: (value) {
              if (value == null) {
                return "  Field is empty !  ";
              } else if (value.isEmpty) {
                return "Field is empty!";
              }
            },
            decoration: InputDecoration(
              fillColor: Colors.white70,
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 4),
                gapPadding: 20,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 4),
                  gapPadding: 5,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 4),
                  gapPadding: 5,
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              hintText: muHint,
            ),
          ),
        ),
      );
    });
  }
}
