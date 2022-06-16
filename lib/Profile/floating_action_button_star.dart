import 'package:flutter/material.dart';

class FloatingActionButtonStar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonStar();

  }

}

class _FloatingActionButtonStar extends State<FloatingActionButtonStar>{

  bool starConfirm = true;
  void onSelected(){
       setState((){
        starConfirm =!starConfirm;
    }



    );

  }


  @override
  Widget build(BuildContext context) {


    return  FloatingActionButton(
      backgroundColor: Color(0xFFec4f0c),
      mini: true,
      tooltip: "Fav",
      onPressed: onSelected,
      child:  const Icon(

          Icons.star
      ),
    );
  }

}