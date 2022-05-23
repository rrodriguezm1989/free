import 'package:flutter/material.dart';

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
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
      ),
      // ignore: unnecessary_const
      /*image: const DecorationImage(
            image: ExactAssetImage(
                "linear-gradient(132.4deg, #4B18E4 0%, #8A4AD5 64.06%, #B76DCA 92.71%)"),
            fit: BoxFit.fill,
            repeat: ImageRepeat.repeat,
          )),*/

      height: screenHeight * 0.42,
      width: screenWidth,
    );
  }
}
