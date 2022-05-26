import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

// ignore: must_be_immutable
class LargeButton extends StatelessWidget {
  final text;
  final onPress;
  final color;
  final width;

  LargeButton({this.text = "", this.onPress, this.width = 200.0, this.color});

  @override
  Widget build(BuildContext context) {
    Color colorFont = Colors.white;
    BoxDecoration gradient = color == "gradient"
        ? const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(-1.0, -1.2),
                end: Alignment(1.0, 1.2),
                colors: [
                  Color(0xFF4B18E4),
                  Color(0xFF8A4AD5),
                  Color(0xFFB76DCA),
                ],
                stops: [
                  -1,
                  0.64,
                  1.0,
                ]),
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          )
        : const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(80.0)),
          );
    // TODO: implement build
    return TextButton(
      onPressed: onPress,
      child: Container(
          color: color,
          width: width,
          constraints: const BoxConstraints(
              maxWidth: 350.0,
              minHeight: 48.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.openSans(
                color: colorFont, fontWeight: FontWeight.w600),
          )),
    );
  }
}
