import 'package:dandy/Profile/profile_appbar.dart';
import 'package:flutter/material.dart';

import '../common/constants/utils/constant_colors.dart';

class PointsDescription extends StatelessWidget{
  double pointsUser = 20;
  String name ="name ";
  String lastName ="LastName";
  PointsDescription({ required this.pointsUser , required this.name , required this.lastName});
  @override
  Widget build(BuildContext context) {


    final userName= Container(

      margin: const EdgeInsets.only(
        top:75,
        right: 30

      ),


      child: Text(
        "$name \n$lastName",

        style: const TextStyle(
            fontSize:30,
          color: Color(0xFFec4f0c,
          ), decoration: TextDecoration.none,
          fontFamily: "Open Sans"
        ),
        textAlign: TextAlign.left,
      ),


 );



    final points = Container(
            height: 71,
            width: 146,
            margin : const EdgeInsets.only(
              left:24,
              top: 88,
              right :30,

            ),

            padding: const EdgeInsets.all(7),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color:  Color(0xFFec4f0c),

            ),
              child: Stack(

                children: <Widget>[

                  Column(
              children: <Widget>[
                Container(
                      height:40,
                      width: 101,


                    child:Text(" $pointsUser",
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            decoration: TextDecoration.none,
                            fontFamily: 'Open Sans'
                        )



                      ),


    ),
          Column(
            children: <Widget>[
              Container(

          child:const Text("points earned",
          style: TextStyle(
          fontSize: 10,
          color: Colors.white,
          decoration: TextDecoration.none
          )



          ),


                      )
                    ],
                  )

    ]
    )
    ]
              )
    );


     return SingleChildScrollView(
        child: Stack(
            children: <Widget>[

          Container(
           child: Row(
             children: [

               points,
              userName,
                      ] ,
                    )
              ),

              const ProfileAppbar()
          ]
        )
     );

  }

}