import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/coupon/models/model_coupon.dart';
import 'package:flutter/material.dart';

const _space = SizedBox(height: 25);

class CouponRedeemed extends StatelessWidget {
  final Coupon coupon;

  const CouponRedeemed({Key? key, required this.coupon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final card = _CongratsCard(size: size, coupon: coupon);
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFFFB814D), Color(0xFFFB285C)])),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(
              'Producto redimido',
              style: TextStyle(
                  fontSize: 15, color: secondary, fontWeight: FontWeight.w700),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                card,
                _space,
                SizedBox(
                  width: size.width * .8,
                  child: Text(
                    'Use the first moments in study. You may miss an opportunity for quick victory this way, but the moments of study are insurance of success. Take your time and be sure.',
                    style: TextStyle(
                      color: secondary,
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      minimumSize: Size(size.width, 70),
                    ),
                    onPressed: () {},
                    child: Container(
                      width: size.width * .9,
                      padding: const EdgeInsets.all(20),
                      child: const Text(
                        'Listo',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(40)),
                    )),
                _space
              ],
            ),
          )),
    );
  }
}

class _CongratsCard extends StatelessWidget {
  final Size size;
  final Coupon coupon;

  const _CongratsCard({Key? key, required this.size, required this.coupon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .9,
      padding: const EdgeInsets.only(top: 15.0, left: 20, right: 20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
          color: secondary, borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.white,
            size: 70,
          ),
          _space,
          getTitle('CONGRATULATIONS!'),
          const Text(
            '¡Haz redimido tu código exitosamente!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          _space,
          getTitle('Code: ${coupon.code}'),
          _space,
          Container(
            width: size.width * .65,
            height: size.width * .65 * .5,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(coupon.image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(15)),
          ),
          _space,
          getTitle(coupon.title),
          _space
        ],
      ),
    );
  }

  Widget getTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.w700),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}