import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget {
  final text;
  final color;
  final FontWeight weight;
  final double fontSize;
  final TextAlign? align;

  TextInput(
      {required this.text,
      this.color = Colors.white,
      this.weight = FontWeight.w400,
      this.fontSize = 12.0, this.align});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        style: GoogleFonts.openSans(
          fontSize: fontSize,
          color: color,
          fontWeight: weight,
          decoration: TextDecoration.none,
        ));
  }
}
