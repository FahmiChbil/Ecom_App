// ignore_for_file: must_be_immutable, file_names

import 'package:ecapp/Product/presentation/pages/Store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/responsive/ui_conponment/info_widget.dart';
import '../bloc/bloc/auth_bloc.dart';
import '../widgets/Sign_in/arrow_back_btn.dart';
import '../widgets/Sign_in/forgot_password.dart';
import '../widgets/Sign_in/hello.dart';
import '../widgets/Sign_in/textformfield.dart';
import '../widgets/signIn_or_up_btn.dart';

class SignInPage extends StatelessWidget {
  static String id = "Sign page";
  GlobalKey<FormState> formkey = GlobalKey();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    TextEditingController usernameControler = TextEditingController();
    TextEditingController passwordControler = TextEditingController();

    final screenwith = MediaQuery.of(context).size.width;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoadingSignInState) {
          isLoading = true;
        } else if (state is SuccesSignInStat) {
          Navigator.pushNamed(context, StorePage.id);
          isLoading = false;
        } else if (state is ErrorSignInState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("username or password wronng")));
          isLoading = false;

          isLoading = false;
        }
      },
      child: ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(),
          inAsyncCall: isLoading,
          child: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoWidget(builder: (context, deviceInfo) {
                        return SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 15
                              : deviceInfo.screenHeight / 37,
                        );
                      }),
                      InfoWidget(builder: (context, deviceInfo) {
                        return ArrowBackBtn(
                            heigh:
                                deviceInfo.orientation == Orientation.portrait
                                    ? deviceInfo.screenHeight / 13
                                    : deviceInfo.screenHeight / 10,
                            widdth:
                                deviceInfo.orientation == Orientation.portrait
                                    ? deviceInfo.screenWidth / 6
                                    : deviceInfo.screenWidth / 11);
                      }),
                      InfoWidget(builder: (context, deviceInfo) {
                        return SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 16
                              : deviceInfo.screenHeight / 47,
                        );
                      }),
                      InfoWidget(builder: (context, deviceInfo) {
                        return HelloWidget(
                          text: "Hello Again!\nWelcome\nBack",
                          textheight:
                              deviceInfo.orientation == Orientation.portrait
                                  ? deviceInfo.screenHeight / 20
                                  : deviceInfo.screenHeight / 35,
                        );
                      }),
                      Form(
                          key: formkey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextformField(
                                  obsucure: false,
                                  muHint: 'username',
                                  controllerText: usernameControler),
                              InfoWidget(builder: (context, deviceInfo) {
                                return SizedBox(
                                  height: deviceInfo.orientation ==
                                          Orientation.portrait
                                      ? screenwith / 18
                                      : screenwith / 40,
                                );
                              }),
                              TextformField(
                                  obsucure: false,
                                  muHint: 'password',
                                  controllerText: passwordControler),
                            ],
                          )),
                      InfoWidget(builder: (context, deviceInfo) {
                        return SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? screenwith / 18
                              : screenwith / 40,
                        );
                      }),
                      SignInOrUpBtn(
                        textBtn: "Sign in",
                        screenwith: screenwith,
                        onPress: () async {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(SignInEvent(
                                username: "atuny0", password: "9uQFF1Lh"));
                          } else {}
                        },
                      ),
                      InfoWidget(builder: (context, deviceInfo) {
                        return SizedBox(
                          height: deviceInfo.orientation == Orientation.portrait
                              ? deviceInfo.screenHeight / 80
                              : deviceInfo.screenHeight / 40,
                        );
                      }),
                      const ForgotPassword()
                    ],
                  )),
            ),
          )),
    );
  }
}
