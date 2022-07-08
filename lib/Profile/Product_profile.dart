import 'package:flutter/material.dart';

import 'floating_action_button_star.dart';

class ProductProfile extends StatelessWidget{
  String productName = "product ";
  int points = 0;
   bool confirm= false;

  ProductProfile(this.productName, this.points, this.confirm);


  @override
  Widget build(BuildContext context) {



    final nameProduct = Container(

        child: Text(
          productName,
          style: const TextStyle(
              decoration: TextDecoration.none,
              fontSize: 17.0,
            fontWeight: FontWeight.w500,
              color: Colors.white,
            fontFamily: "Open Sans"
          ),
          textAlign: TextAlign.left,
    ),
    );

    final pointss = Container(
      alignment: const Alignment(0.9, -0.4),
      child: Text(
        "$points pts",
        style: const TextStyle(
            decoration: TextDecoration.none,
            fontSize: 17.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: "Open Sans"
        ),
        textAlign: TextAlign.left,
      ),
    );


    final cardProduct = Container (


      height: 54,
      width: 365,
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: const Color(0xFF19254d)
      ),
      child: Stack(
        alignment: const Alignment(0.9, 0.1),
        children: <Widget>[
            Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children :<Widget>[
              nameProduct,
             ]
          ),
          const Padding(padding:EdgeInsets.only(
            right: 300,
          )
          ),
       pointss

          ]
          )

    );

    if (confirm== true ){
    return Stack(
      alignment: const Alignment(1, -1.4 ),
      children: <Widget> [

      cardProduct,
        FloatingActionButtonStar()
        ]

    );
  }else{
      return SingleChildScrollView(
        child: Stack(
          alignment: const Alignment(1, -1.4 ),
          children: <Widget> [

          cardProduct,
    ]
        )
      );
    }
  }

}