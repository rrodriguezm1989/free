import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/coupon/models/model_coupon.dart';
import 'package:dandy/coupon/notifiers/coupon_notifier.dart';
import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;
  final Size size;
  final ValueNotifier<int> points;

  const CouponCard(
      {Key? key,
      required this.coupon,
      required this.size,
      required this.points})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final redeemed = CouponNotifier(coupon);
    return GestureDetector(
      onTap: () {
        if (coupon.redeemed) return;
        Navigator.of(context).pushNamed('/coupon/1',
            arguments: CouponDescriptionArgs(points: points, coupon: redeemed));
      },
      child: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(clipBehavior: Clip.none, children: [
          Container(),
          Hero(
            tag: coupon.code,
            child: Image.network(
              coupon.image,
              fit: BoxFit.cover,
              height: size.height,
              width: size.width,
            ),
          ),
          _buildShadowGradient(size.height),
          Positioned(
              right: 10,
              top: 5,
              child: ValueListenableBuilder(
                valueListenable: redeemed,
                builder: (_, Coupon cp, __) => Chip(
                  label: Text(
                    'Redimir',
                    style: TextStyle(
                        color: cp.redeemed ? Colors.black : Colors.white),
                  ),
                  backgroundColor: cp.redeemed ? Colors.grey : principal,
                ),
              )),
          Positioned(
            bottom: 5,
            right: 10,
            child: Text(
              '${coupon.points} pts',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ]),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.height * .1)),
      ),
    );
  }
}

Widget _buildShadowGradient(double itemSize) {
  return SizedBox(
    height: itemSize,
    child: const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black87,
          ],
        ),
      ),
      child: SizedBox.expand(),
    ),
  );
}
