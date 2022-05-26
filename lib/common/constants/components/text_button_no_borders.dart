import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

// ignore: must_be_immutable
class TextButtonNoBorders extends StatelessWidget {
  final text;
  final onPress;
  final color;
  final underline;

  TextButtonNoBorders(
      {this.text = "",
      this.onPress,
      this.color = Colors.white,
      this.underline = false});

  @override
  Widget build(BuildContext context) {
    TextDecoration style =
        underline ? TextDecoration.underline : TextDecoration.none;
    return SizedBox(
      height: 20,
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              minimumSize: const Size(50, 20),
              alignment: Alignment.centerLeft),
          onPressed: onPress,
          child: Text(
            text,
            style: GoogleFonts.openSans(
                color: color,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                decoration: style),
          )),
    );
  }
}
