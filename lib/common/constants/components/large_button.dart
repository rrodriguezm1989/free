import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class LargeButton extends StatelessWidget {
  String text = "";
  var onPress = (String s) => {() => {}};

  LargeButton(this.text, this.onPress);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextButton(
      onPressed: () => onPress("hola"),
      child: Ink(
        decoration: const BoxDecoration(
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
          borderRadius: BorderRadius.all(Radius.circular(80.0)),
        ),
        child: Container(
            constraints: const BoxConstraints(
                maxWidth: 300.0,
                minHeight: 48.0), // min sizes for Material buttons
            alignment: Alignment.center,
            child: Text(
              "Verification code",
              style: GoogleFonts.openSans(
                  color: Colors.white, fontWeight: FontWeight.w600),
            )),
      ),
    );
  }
}
