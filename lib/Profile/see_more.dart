
import 'dart:ffi';

import 'package:dandy/Profile/review_list.dart';
import 'package:flutter/material.dart';

import 'review_list.dart';

class SeeMore extends StatefulWidget {


  var listProduct = const ReviewList() ;
  bool isExpanded = false;

  @override
  _SeeMore createState() => _SeeMore();
}

class _SeeMore extends State<SeeMore> {
  @override
  Widget build(BuildContext context) {
    if(widget.isExpanded== true ){

    }
    return Column(children: <Widget>[
      ConstrainedBox(
          constraints: widget.isExpanded
              ? const BoxConstraints()
              : const BoxConstraints(maxHeight: 240.0),
          child:Container(
              child: widget.listProduct,


      )
      ),
      widget.isExpanded
          ?FlatButton(
          child: const Text( 'See Less ',
              style: TextStyle(
                  color: Colors.white,
                fontFamily: "Open Sans"
              )
          ),
          onPressed: () => setState(() => widget.isExpanded =! widget.isExpanded))
          : FlatButton(
          child: const Text( 'See More ',
            style: TextStyle(
             color: Colors.white,
              fontFamily: "Open Sans"
            )
          ),
          onPressed: () => setState(() => widget.isExpanded =! widget.isExpanded))
    ]
    );
  }
}
