import 'package:flutter/material.dart';

import 'package:dandy/coupon/models/coupon_model.dart';
import 'package:dandy/coupon/widgets/coupon_card.dart';

class CouponList extends StatelessWidget {
  final List<Coupon> coupons;
  final ValueNotifier<int> points;

  const CouponList({Key? key, required this.coupons, required this.points}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final screenSize = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenSize,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for(var coupon in coupons)
              CouponCard(coupon: coupon, size: Size(screenSize*.9, screenSize * .45), points: points,),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}
