// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../core/const.dart';
import '../../../core/responsive/ui_conponment/info_widget.dart';

class SignInOrUpBtn extends StatelessWidget {
  final Function() onPress;
  final String textBtn;
  const SignInOrUpBtn(
      {super.key,
      required this.screenwith,
      required this.onPress,
      required this.textBtn});

  final double screenwith;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).orientation == Orientation.portrait
            ? screenwith / 40
            : screenwith / 28,
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(myblack)),
        child: SizedBox(
          child: InfoWidget(builder: (context, deviceInfo) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "$textBtn ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: deviceInfo.orientation == Orientation.portrait
                          ? deviceInfo.localWidth / 15
                          : deviceInfo.localWidth / 40),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
