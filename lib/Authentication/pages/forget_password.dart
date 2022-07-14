// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dandy/Authentication/bloc/authentication_bloc.dart';
import 'package:dandy/Authentication/bloc/authentication_event.dart';
import 'package:dandy/Authentication/components/background.dart';
import 'package:dandy/Authentication/components/white_background.dart';
import 'package:dandy/common/constants/components/dropdown_input.dart';
import 'package:dandy/common/constants/components/logo.dart';
import 'package:dandy/common/constants/components/text_button_no_borders.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/Authentication/components/activity_indicator.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPassword createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword> {
  final _bloc = AuthenticationBloC();

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Scaffold(body: Body());
  }

  @override
  dispose() {
    super.dispose();
    _bloc.dispose();
  }

  Center Body() {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
        child: Container(
            width: width,
            height: height,
            color: constantColors.secondary,
            child: Center(
              child: Container(
                width: width * 310 / 375,
                color: constantColors.secondary,
                //padding: EdgeInsets.only(left: ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextInput(
                        text: "Reset Password",
                        color: Colors.white,
                        fontSize: width * 18 / 375,
                        weight: FontWeight.w600,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: height * 18.0 / 675,
                            top: height * 80 / 675),
                        child: TextInput(
                          text: "Correo electronico",
                          fontSize: width * 14 / 375,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TypicalInput(
                      hintText: "Correo electronico",
                      widthField: width * 310 / 375,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: height * 8.0 / 675, bottom: height * 8 / 675),
                      child: TextInput(
                          text:
                              "Recibiras un correo electronico con las instrucciones para resetear tu password."),
                    ),
                    Row(
                      children: [
                        TextInput(
                            text:
                                "Si no recibes el correo, revisa tu carpeta de spam y sino"),
                      ],
                    ),
                    TextButtonNoBorders(
                      text: "enviar el correo de nuevo.",
                      underline: true,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: height * 87 / 675, top: height * 144 / 675),
                      child: LargeButton(
                        text: "Cambiar password",
                        gradient: true,
                        width: width * 310 / 375,
                        height: height * 58 / 667 * 0.85,
                        onPress: () {
                          Navigator.of(context).pushNamed(
                            '/forget_password/1',
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
