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

class LogInWithOptions extends StatefulWidget {
  @override
  _LogInWithOptions createState() => _LogInWithOptions();
}

class _LogInWithOptions extends State<LogInWithOptions> {
  final _bloc = AuthenticationBloC();

  @override
  Widget build(BuildContext context) {
    int stepHeader = 1;
    int stepMessageTop = 4;
    // ignore: dead_code
    return Scaffold(
      // body: ValueListenableBuilder(
      //   valueListenable: _bloc.counter,
      //   builder: (context, int counter, child) {
      //     return Body(headers, stepHeader, messagesTop, stepMessageTop, context,
      //         counter);
      //   },
      // ),
      //);
      body: StreamBuilder<int>(
        stream: _bloc.counterStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SnackBar(
              content: Text('There is an error!'),
            );
          }
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }

          return Body(stepHeader, stepMessageTop, context, snapshot.data!);
        },
      ),
    );
  }

  @override
  dispose() {
    super.dispose();
    _bloc.dispose();
  }

  Center Body(
      int stepHeader, int stepMessageTop, BuildContext context, int counter) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Center(
        child: Container(
      color: constantColors.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(top: height * 0.26, bottom: height * 0.26),
            color: constantColors.secondary,
            child: Logo(
              sizeLogo: 50.0,
              sizeTM: 12.0,
              color: Colors.white,
            ),
          ),
          LargeButton(
            tile: const Icon(
              Icons.facebook_outlined,
              color: Colors.white,
              size: 24,
            ),
            text: "Iniciar sesión con Facebook",
            color: constantColors.facebook,
            width: width * 0.82,
            height: (height * 58 / 667 * 0.85).toDouble(),
            onPress: () => {},
          ),
          LargeButton(
            tile: Image.asset(
              "./assets/images/google_logo.png",
              height: 24,
              width: 24,
            ),
            text: "Iniciar sesión con Google",
            color: constantColors.google,
            width: width * 0.82,
            height: (height * 58 / 667 * 0.85).toDouble(),
            fontColor: const Color(0xDD0000000),
            onPress: () => {},
          ),
          LargeButton(
            text: "Iniciar sesión",
            color: constantColors.principal,
            gradient: true,
            width: width * 0.82,
            height: (height * 58 / 667 * 0.85).toDouble(),
            onPress: () => {
              Navigator.of(context).pushNamed(
                '/login/1',
              )
            },
          ),
          alreadyHaveAnAccount(context)
        ],
      ),
    ));
  }

  Row alreadyHaveAnAccount(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextInput(text: "No tienes cuenta? "),
        TextButtonNoBorders(
          text: "Crea cuenta nueva",
          onPress: () => {
            Navigator.of(context).pushNamed(
              '/sign_up/0',
            )
          },
          color: Colors.white,
          underline: true,
        )
      ],
    );
  }
}
