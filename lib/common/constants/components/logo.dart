import 'package:dandy/common/constants/components/text_input.dart';
import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:flutter/material.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;

import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  double sizeLogo;
  double sizeTM;

  Logo(this.sizeLogo, this.sizeTM, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("FreebieGo",
            style: GoogleFonts.montserratAlternates(
                color: constantColors.secondary,
                fontWeight: FontWeight.w800,
                fontSize: sizeLogo)),
        Text("™",
            style: GoogleFonts.montserratAlternates(
                color: constantColors.secondary,
                fontWeight: FontWeight.w700,
                fontSize: sizeTM)),
      ],
    );
  }
}
