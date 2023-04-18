import 'package:ecapp/Auth/Presentation/pages/Sign_up.dart';
import 'package:flutter/material.dart';

import '../../../../core/responsive/ui_conponment/info_widget.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InfoWidget(builder: (context, deviceInfo) {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).orientation == Orientation.portrait
              ? deviceInfo.screenHeight / 40
              : deviceInfo.screenWidth / 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Forgot your password",
              style: TextStyle(
                  fontSize: deviceInfo.orientation == Orientation.portrait
                      ? deviceInfo.screenHeight / 50
                      : deviceInfo.screenWidth / 65),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, SignUp.id);
              },
              child: Text(
                "Sign up",
                style: TextStyle(
                    fontSize: deviceInfo.orientation == Orientation.portrait
                        ? deviceInfo.screenHeight / 50
                        : deviceInfo.screenWidth / 65),
              ),
            ),
          ],
        ),
      );
    });
  }
}
