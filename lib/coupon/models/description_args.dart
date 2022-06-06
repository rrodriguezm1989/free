import 'package:dandy/coupon/notifiers/coupon_notifier.dart';
import 'package:flutter/material.dart';

class CouponDescriptionArgs {
  ValueNotifier<int> points;
  final CouponNotifier coupon;

  CouponDescriptionArgs({required this.points, required this.coupon});
}
