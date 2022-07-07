import 'package:dandy/Profile/Layaout/breakpoints.dart';
import 'package:flutter/cupertino.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout(
      {Key? key,
      required this.mobileBodyOne,
      required this.mobileBodyTwo,
      required this.mobileBodyThree,
      required this.mobileBodyFour})
      : super(key: key);

  final Widget mobileBodyOne;
  final Widget mobileBodyTwo;
  final Widget mobileBodyThree;
  final Widget mobileBodyFour;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= kMobileBreakpointZero) {
          return mobileBodyOne;
        } else if (constraints.maxWidth >= kMobileBreakpointOne) {
          return mobileBodyTwo;
        } else if (constraints.maxWidth >= kMobileBreakpointTwo) {
          return mobileBodyThree;
        } else if (constraints.maxWidth >= kMobileBreakpointThree) {
          return mobileBodyFour;
        } else {
          return mobileBodyOne;
        }
      },
    );
  }
}
