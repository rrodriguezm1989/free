import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class TextInput extends StatelessWidget {
  final text;
  final color;

  TextInput({this.text = "", this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.openSans(
            fontSize: 12, color: color, fontWeight: FontWeight.w400));
  }
}
