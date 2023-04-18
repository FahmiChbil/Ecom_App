// ignore_for_file: file_names

import 'package:ecapp/Auth/Presentation/bloc/bloc/auth_bloc.dart';
import 'package:ecapp/Auth/Presentation/widgets/Sign_in/hello.dart';
import 'package:ecapp/Auth/Presentation/widgets/Sign_in/textformfield.dart';
import 'package:ecapp/Auth/Presentation/widgets/signIn_or_up_btn.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/responsive/ui_conponment/info_widget.dart';
import '../widgets/Sign_in/arrow_back_btn.dart';

class SignUp extends StatelessWidget {
  static String id = "sigup";

  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey0 = GlobalKey();
    bool isLoading = false;
    TextEditingController usernameControler = TextEditingController();
    TextEditingController passwordControler = TextEditingController();
    TextEditingController emailAdressController = TextEditingController();
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is LoadingSignInState) {
          isLoading = true;
        } else if (state is SuccesSignUpStat) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("User added succesfully")));

          isLoading = false;
        } else if (state is ErrorSignUpState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Adding user not complited")));
          isLoading = false;
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        progressIndicator: const CircularProgressIndicator(),
        child: SafeArea(
            child: GestureDetector(
                onTap: () {},
                child: InfoWidget(builder: (context, deviceInfo) {
                  return Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 15
                              : deviceInfo.screenWidth / 37,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: ArrowBackBtn(
                              heigh:
                                  deviceInfo.orientation == Orientation.portrait
                                      ? deviceInfo.screenHeight / 17
                                      : deviceInfo.screenHeight / 12,
                              widdth:
                                  deviceInfo.orientation == Orientation.portrait
                                      ? deviceInfo.screenWidth / 6
                                      : deviceInfo.screenWidth / 11),
                        ),
                        SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 35
                              : deviceInfo.screenHeight / 50,
                        ),
                        HelloWidget(
                            textheight:
                                deviceInfo.orientation == Orientation.portrait
                                    ? deviceInfo.screenHeight / 24
                                    : deviceInfo.screenHeight / 30,
                            text: deviceInfo.orientation == Orientation.portrait
                                ? "Hello!\n Signup to\n get started"
                                : "Hello! Signup to\n get started"),
                        SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 30
                              : deviceInfo.screenHeight / 40,
                        ),
                        Form(
                            key: formkey0,
                            child: Column(
                              children: [
                                TextformField(
                                    muHint: "Name",
                                    controllerText: usernameControler,
                                    obsucure: false),
                                SizedBox(
                                  height: deviceInfo.orientation ==
                                          Orientation.portrait
                                      ? deviceInfo.screenHeight / 35
                                      : deviceInfo.screenHeight / 35,
                                ),
                                TextformField(
                                    muHint: "Email Address",
                                    controllerText: emailAdressController,
                                    obsucure: false),
                                SizedBox(
                                  height: deviceInfo.orientation ==
                                          Orientation.portrait
                                      ? deviceInfo.screenHeight / 35
                                      : deviceInfo.screenHeight / 35,
                                ),
                                TextformField(
                                    muHint: "Password",
                                    controllerText: passwordControler,
                                    obsucure: true),
                              ],
                            )),
                        SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 25
                              : deviceInfo.screenHeight / 35,
                        ),
                        SignInOrUpBtn(
                            textBtn: "Sign Up",
                            screenwith:
                                deviceInfo.orientation == Orientation.portrait
                                    ? deviceInfo.screenWidth / 0.7
                                    : deviceInfo.screenWidth / 0.7,
                            onPress: () async {
                              if (formkey0.currentState!.validate()) {
                                BlocProvider.of<AuthBloc>(context).add(
                                    SignUpEvent(
                                        username: usernameControler.text,
                                        password: passwordControler.text,
                                        email: emailAdressController.text));
                              } else {}
                            }),
                      ],
                    ),
                  );
                }))),
      ),
    );
  }
}
