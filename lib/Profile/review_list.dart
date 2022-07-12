import 'package:dandy/Profile/Product_profile.dart';
import 'package:dandy/common/constants/components/text_input.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txt = Container(
        alignment: Alignment.bottomLeft,
        padding: const EdgeInsets.only(left: 20),
        child: TextInput(
          text: "Echa un vistazo a lo que has hecho:",
          color: Colors.white,
          fontSize: 15,
          weight: FontWeight.w600,
        )
        /*const
       Text(
        "Echa un vistazo a lo que has hecho:",
        style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
            fontSize: 15,
            fontFamily: "Open Sans"),
      ),*/
        );
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        txt,
        ProductProfile("product c ", 40, false),
        ProductProfile("product b ", 70, true),
        ProductProfile("product c ", 70, false),
        ProductProfile("product c ", 70, false),
        ProductProfile("product c ", 70, false),
        ProductProfile("product c ", 70, true),
        ProductProfile("product c ", 70, false),
        ProductProfile("product c ", 70, false),
        ProductProfile("product c ", 70, false),
        ProductProfile("product c ", 70, false),
        ProductProfile("product c ", 70, false),
        ProductProfile("product c ", 70, false),
      ],
    ));
  }
}
