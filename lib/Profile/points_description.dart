import 'package:dandy/Profile/Layaout/responsive_layout.dart';
import 'package:dandy/Profile/profile_appbar.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/constants/utils/constant_colors.dart';

class PointsDescription extends StatelessWidget {
  final int pointsUser;
  final String name;
  final String lastName;

  PointsDescription(
      {required this.pointsUser, required this.name, required this.lastName});
  @override
  Widget build(BuildContext context) {
    NumberFormat myFormat = NumberFormat.decimalPattern('es');
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final userName = ResponsiveLayout(
        mobileBodyOne: Container(
          margin: const EdgeInsets.only(top: 75, right: 50),
          child: Text(
            "$name \n$lastName",
            style: const TextStyle(
                fontSize: 15,
                color: Color(
                  0xFFec4f0c,
                ),
                decoration: TextDecoration.none,
                fontFamily: "Open Sans"),
            textAlign: TextAlign.left,
          ),
        ),
        mobileBodyTwo: Container(
          margin: const EdgeInsets.only(top: 75, right: 30),
          child: Text(
            "$name \n$lastName",
            style: const TextStyle(
                fontSize: 30,
                color: Color(
                  0xFFec4f0c,
                ),
                decoration: TextDecoration.none,
                fontFamily: "Open Sans"),
            textAlign: TextAlign.left,
          ),
        ),
        mobileBodyThree: Container(
          margin: const EdgeInsets.only(top: 75, right: 30),
          child: Text(
            "$name \n$lastName",
            style: const TextStyle(
                fontSize: 30,
                color: Color(
                  0xFFec4f0c,
                ),
                decoration: TextDecoration.none,
                fontFamily: "Open Sans"),
            textAlign: TextAlign.left,
          ),
        ),
        mobileBodyFour: Container(
          margin: const EdgeInsets.only(top: 75, right: 30),
          child: Text(
            "$name \n$lastName",
            style: const TextStyle(
                fontSize: 30,
                color: Color(
                  0xFFec4f0c,
                ),
                decoration: TextDecoration.none,
                fontFamily: "Open Sans"),
            textAlign: TextAlign.left,
          ),
        ));

    final points = Container(
        width: width * 146 / 374,
        height: height * 71 / 667,
        // width: 160,
        margin: EdgeInsets.only(
          left: width * 24 / 667,
          top: 88,
          right: 30,
        ),
        padding: EdgeInsets.only(left: width * 16 / 374),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(width * 8 / 374)),
          color: Color(0xFFec4f0c),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*Text(myFormat.format(pointsUser),
              style: const TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  decoration: TextDecoration.none,
                  fontFamily: 'Open Sans')),*/
              TextInput(
                text: myFormat.format(pointsUser),
                fontSize: 32,
                weight: FontWeight.w600,
                color: Colors.white,
              ),
              TextInput(
                text: "puntos ganados",
                fontSize: 14,
                weight: FontWeight.w400,
              )
              /*
          const Text("points earned",
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  decoration: TextDecoration.none)),*/
            ]));

    return SingleChildScrollView(
        child: Stack(children: <Widget>[
      Center(
          child: Row(
        children: [
          points,
          userName,
        ],
      )),
      const ProfileAppbar()
    ]));
  }
}
