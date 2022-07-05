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
  final loading;
  final borders;
  final height;
  final tile;
  final fontColor;

  LargeButton(
      {this.text = "",
      this.onPress,
      this.width = 200.0,
      this.color = Colors.white,
      this.borders = true,
      this.loading = false,
      this.height = 32.0,
      this.fontColor = Colors.white,
      this.tile});

  @override
  Widget build(BuildContext context) {
    BoxDecoration deco = borders
        ? BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(80.0)),
          )
        : BoxDecoration(
            color: color,
          );
    // TODO: implement build
    return TextButton(
        onPressed: onPress,
        child: Container(
            decoration: deco,
            width: width.toDouble(),
            constraints: BoxConstraints(
                maxWidth: 350.0,
                minHeight: height), // min sizes for Material buttons
            alignment: Alignment.center,
            child: tile != null
                ? ListTile(
                    leading: tile,
                    title: Text(
                      text,
                      style: GoogleFonts.openSans(
                          color: fontColor,
                          fontWeight: FontWeight.w600,
                          fontSize: height * 16 / 58),
                    ))
                : Text(
                    text,
                    style: GoogleFonts.openSans(
                        color: fontColor,
                        fontWeight: FontWeight.w600,
                        fontSize: height * 16 / 58),
                  )));
  }
}
