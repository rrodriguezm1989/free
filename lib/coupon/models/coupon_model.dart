import 'package:dandy/common/model/product_model.dart';

class Coupon {
  bool redeemed;
  Product product;
  String code;
  int points;

  Coupon({
    this.redeemed = false,
    required this.product,
    required this.code,
    this.points = 30,
  });
}
