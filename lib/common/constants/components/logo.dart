import 'package:dandy/common/constants/components/text_input.dart';
import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:flutter/material.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  final sizeLogo;
  final sizeTM;
  final color;

  Logo({this.sizeLogo, this.sizeTM, this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment:
          MainAxisAlignment.center, //Center Row contents horizontally,
      crossAxisAlignment:
          CrossAxisAlignment.center, //Center Row contents vertically,
      children: [
        Text("FreebieGo",
            style: GoogleFonts.montserratAlternates(
                color: color,
                fontWeight: FontWeight.w800,
                fontSize: sizeLogo.toDouble())),
        Text("™",
            style: GoogleFonts.montserratAlternates(
                color: color,
                fontWeight: FontWeight.w700,
                fontSize: sizeTM.toDouble())),
      ],
    ));
  }
}
