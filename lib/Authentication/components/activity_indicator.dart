import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class ActivityIndicator extends StatelessWidget {
  int stepMessageTop = 0;
  var messagesTop = [];

  ActivityIndicator(this.stepMessageTop, this.messagesTop);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AnimatedSmoothIndicator(
      activeIndex: stepMessageTop,
      count: messagesTop.length,
      effect: const WormEffect(
        radius: 4.0,
        dotWidth: 8.0,
        dotHeight: 8.0,
        spacing: 4.0,
        paintStyle: PaintingStyle.stroke,
        strokeWidth: 1.5,
        dotColor: Color.fromRGBO(255, 255, 255, 0.6),
        activeDotColor: Colors.white,
      ),
    );
  }
}
