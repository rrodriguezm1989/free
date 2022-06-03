import 'package:flutter/material.dart';

import 'package:dandy/coupon/models/coupon_model.dart';
import 'package:dandy/coupon/widgets/coupon_card.dart';

class CouponList extends StatelessWidget {
  final List<Coupon> coupons;

  const CouponList({Key? key, required this.coupons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groups = coupons.length ~/ 4;
    final tale = coupons.length % 4;
    final cols = <Column>[];

    for (int i = 0; i < groups; i++) {
      final col = Column(children: [
        for (int j = 0; j < 4; j++) CouponCard(coupon: coupons[(i * 4) + j])
      ]);
      cols.add(col);
    }

    if (tale != 0) {
      final col = Column(children: [
        for (int j = 0; j < tale; j++)
          CouponCard(coupon: coupons[(groups * 4) + j])
      ]);
      cols.add(col);
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          ...cols,
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
