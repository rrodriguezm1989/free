import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/coupon/models/model_coupon.dart';
import 'package:flutter/material.dart';

class CouponDescription extends StatelessWidget {
  late final CouponDescriptionArgs args;

  CouponDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as CouponDescriptionArgs;
    final size = MediaQuery.of(context).size;
    final width = size.width * .9;
    final appBar = AppBar(
      backgroundColor: secondary,
      elevation: 0,
      title: Text(
        'Redimir',
        style: TextStyle(fontSize: 15, color: principal),
      ),
    );

    return Scaffold(
      appBar: appBar,
      backgroundColor: secondary,
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 20,
            ),
            Container(
              width: width,
              height: width * .50,
              child: Hero(
                tag: args.coupon.value.code,
                child: Image(
                  image: NetworkImage(args.coupon.value.product.image),
                  fit: BoxFit.cover,
                  width: width,
                  height: width * .50,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                args.coupon.value.product.title,
                style: TextStyle(
                  color: principal,
                  fontSize: 35,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                args.coupon.value.product.description,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  'Ver tus puntos: ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.start,
                ),
                ValueListenableBuilder(
                  builder: (_, int vl, __) => Text(
                    '$vl pts',
                    style: TextStyle(
                      color: principal,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  valueListenable: args.points,
                ),
              ],
            ),
            TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size(size.width, 70),
                ),
                onPressed: () {
                  args.coupon.redeem();
                  args.points.value -= args.coupon.value.points;
                  Navigator.of(context)
                      .pushNamed('/coupon/2', arguments: args.coupon);
                },
                child: Container(
                  width: size.width * .9,
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    'Redimir ${args.coupon.value.points} pts',
                    style: TextStyle(color: secondary, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  decoration: BoxDecoration(
                      color: principal,
                      borderRadius: BorderRadius.circular(40)),
                )),
          ]),
        ),
      ),
    );
  }
}
