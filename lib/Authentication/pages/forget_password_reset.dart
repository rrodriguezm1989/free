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

class ForgetPasswordReset extends StatefulWidget {
  @override
  _ForgetPasswordReset createState() => _ForgetPasswordReset();
}

class _ForgetPasswordReset extends State<ForgetPasswordReset> {
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
                          text: "Nuevo password",
                          fontSize: width * 14 / 375,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TypicalInput(
                      hintText: "Nuevo password",
                      widthField: width * 310 / 375,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: height * 18.0 / 675,
                            top: height * 18 / 675),
                        child: TextInput(
                          text: "Confirma el nuevo password",
                          fontSize: width * 14 / 375,
                          weight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TypicalInput(
                      hintText: "Confirma el nuevo password",
                      widthField: width * 310 / 375,
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
                            '/login/1',
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
