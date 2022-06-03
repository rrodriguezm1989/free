import 'package:dandy/coupon/models/model_coupon.dart';
import 'package:flutter/material.dart';

class CouponCard extends StatelessWidget {
  final Coupon coupon;
  final Size size;

  const CouponCard({Key? key, required this.coupon, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: size.width,
        height: size.height,
        margin: const EdgeInsets.all(8),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          clipBehavior: Clip.none,
            children: [
          Container(),
          Image.network(
            coupon.image,
            fit: BoxFit.cover,
            height: size.height,
            width: size.width,
          ),
          _buildShadowGradient(size.height),
          Positioned(
            bottom: 5,
            right: 10,
            child: Text(
              '${coupon.points} pts',
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ]),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(size.height*.1)),
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
