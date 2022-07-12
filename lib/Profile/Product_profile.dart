import 'package:dandy/common/constants/components/text_button_no_borders.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'floating_action_button_star.dart';

class ProductProfile extends StatelessWidget {
  String productName = "product ";
  int points = 0;
  bool confirm = false;

  ProductProfile(this.productName, this.points, this.confirm);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final nameProduct = confirm == false
        ? Padding(
            padding: EdgeInsets.only(
                left: width * 16 / 375, right: width * 152 / 375),
            child: Text(
              productName,
              style: const TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontFamily: "Open Sans"),
              //textAlign: TextAlign.center,
            ))
        : Padding(
            padding: EdgeInsets.only(
                left: width * 16 / 375, right: 54 * width / 375),
            child: Row(
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontFamily: "Open Sans"),
                  //textAlign: TextAlign.center,
                ),
                TextButtonNoBorders(
                  text: "Available survey",
                  underline: true,
                  onPress: () {},
                )
              ],
            ));

    final pointss = Text(
      "+$points" + "pts",
      style: const TextStyle(
          decoration: TextDecoration.none,
          fontSize: 17.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontFamily: "Open Sans"),
      textAlign: TextAlign.left,
    );

    final cardProduct = Container(
        height: 54,
        width: 365,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            border: Border.all(color: Colors.white),
            color: const Color(0xFF19254d)),
        child: Row(children: <Widget>[
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            nameProduct,
          ]),
          pointss,
          /*Transform.rotate(
            angle: 180 * 3.1416 / 180,
            child: IconButton(
              icon: Icon(
                Icons.details,
                color: Colors.white,
              ),
              onPressed: null,
            ),
          ),*/
        ]));

    if (confirm == true) {
      return Stack(alignment: const Alignment(1, -1.4), children: <Widget>[
        cardProduct,
        FloatingActionButtonStar(
          index: Random().nextInt(75),
        )
      ]);
    } else {
      return SingleChildScrollView(
          child: Stack(alignment: const Alignment(1, -1.4), children: <Widget>[
        cardProduct,
      ]));
    }
  }
}
