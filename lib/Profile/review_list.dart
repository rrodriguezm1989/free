import 'package:dandy/Profile/Product_profile.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';


class ReviewList extends StatelessWidget{
  const ReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final txt = Container(
      padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 140
      ),

      child: const Text(
        "Take a look at what you've made",
        style: TextStyle(
            color: Colors.white,
            decoration: TextDecoration.none,
          fontSize: 15,
          fontFamily: "Open Sans"
        ),
      ),
    );
    return SingleChildScrollView(


        child :Column(

      children: <Widget>[
          txt,
          ProductProfile("product c ", 40, false ),
          ProductProfile("product b ", 70, true),
          ProductProfile("product c ", 70, false ),
          ProductProfile("product c ", 70, false ),
          ProductProfile("product c ", 70, false ),
          ProductProfile("product c ", 70, true),
          ProductProfile("product c ", 70, false ),
          ProductProfile("product c ", 70, false ),
          ProductProfile("product c ", 70, false ),
          ProductProfile("product c ", 70, false ),
          ProductProfile("product c ", 70, false ),
          ProductProfile("product c ", 70, false ),



      ],
        )
    );
  }

}