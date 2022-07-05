import 'package:dandy/coupon/widgets/coupon_list.dart';
import 'package:flutter/material.dart';

import '../coupon/models/coupon_model.dart';
import '../coupon/utils/mock_coupon.dart';

class CouponView extends StatelessWidget {
 CouponView({Key? key,  this.points= 13482}) : super(key: key);
    final int points;

  List<Coupon> couponsFiltered = couponList;
  @override
  Widget build(BuildContext context) {
    final pts = ValueNotifier<int>(points);

    return Container(
        child: Expanded(
          child: CouponList(coupons: couponsFiltered, points: pts,),
        )
    );
  }
}
