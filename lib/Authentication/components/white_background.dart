import 'package:flutter/material.dart';

class WhiteBackground extends StatelessWidget {
  // This is a String for the sake of an example.
  // You can use any type you want.
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(90),
          ),
          color: Colors.white,
          border: Border(left: BorderSide(width: 1))),
      height: screenHeight * 0.68,
      width: screenWidth,
    );
  }
}
