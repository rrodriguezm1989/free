import 'package:dandy/coupon/models/model_coupon.dart';
import 'package:flutter/material.dart';

class CouponNotifier extends ValueNotifier<Coupon>{

  CouponNotifier(Coupon value) : super(value);

  void redeem() {
    value.redeemed = true;
    notifyListeners();
  }
}