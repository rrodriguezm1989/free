// ignore_for_file: deprecated_member_use, avoid_print

import 'package:dandy/Authentication/components/background.dart';
import 'package:dandy/Authentication/components/white_background.dart';
import 'package:dandy/common/constants/components/dropdown_input.dart';
import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/Authentication/components/activity_indicator.dart';

class SignUp extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.

  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var headers = ["Let's start", "Welcome back", ""];
    var messagesTop = [
      "Create an account",
      "Verification code",
      "Set up your account",
      "Choose your account type",
      ""
    ];
    int stepHeader = 1;
    int stepMessageTop = 0;
    // ignore: dead_code
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Background(),
          Padding(
            padding: const EdgeInsets.only(left: 42, top: 26 + 40),
            child: Column(
              children: [
                Align(alignment: Alignment.bottomLeft, child: DandyLetters()),
                headerValue(headers, stepHeader),
                messageTopValue(messagesTop, stepMessageTop),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 236 + 26, bottom: 0),
              child: Column(
                children: [
                  ActivityIndicator(stepMessageTop, messagesTop),
                  Stack(
                    children: [
                      WhiteBackground(),
                      Column(
                        children: [
                          LargeButton(
                              text: "text", onPress: (String s) => {() => {}}),
                          TypicalInput("enter text", "text", 300),
                          TypicalInput("enter number", "number", 350),
                          TypicalInput("password", "password", 150),
                          DropdownInput(
                              widthField: 100,
                              hintText: "hintText",
                              items: const ["item 1", "item 2", "item 3"])
                        ],
                      )
                    ],
                  )
                ],
              )),
        ],
      )),
    );
  }

  Widget headerValue(headers, stepHeader) {
    if (headers.length >= stepHeader + 1 && headers[stepHeader] != "") {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Text(headers[stepHeader],
            style: GoogleFonts.montserratAlternates(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 48)),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Widget messageTopValue(messagesTop, stepMessageTop) {
    if (messagesTop.length >= stepMessageTop + 1 &&
        messagesTop[stepMessageTop] != "") {
      return Align(
        alignment: Alignment.bottomLeft,
        child: Text(messagesTop[stepMessageTop],
            style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 18)),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Row DandyLetters() {
    return Row(
      children: [
        Text("Dandy",
            style: GoogleFonts.montserratAlternates(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 24)),
        Text("™",
            style: GoogleFonts.montserratAlternates(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 8)),
      ],
    );
  }
}
