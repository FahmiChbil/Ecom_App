import 'package:flutter/material.dart';

class FailedSignIn extends StatelessWidget {
  static String myroute = "sign";

  const FailedSignIn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("auuth ex"),
      ),
    );
  }
}
