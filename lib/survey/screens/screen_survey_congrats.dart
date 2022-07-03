import 'package:dandy/common/constants/components/congrats_card.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:flutter/material.dart';

class SurveyCongrats extends StatelessWidget {

  const SurveyCongrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int points = ModalRoute.of(context)!.settings.arguments as int;
    final size = MediaQuery.of(context).size;
    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        'Redimir Producto',
        style: TextStyle(fontSize: 15, color: secondary),
      ),
    );

    final btn = LargeButton(
      text: 'Listo',
      color: secondary,
      fontColor: primarySoft,
      height: 58.0,
      width: size.width,
      onPress: () {},
    );

    return Scaffold(
        backgroundColor: principal,
        appBar: appBar,
        body: SafeArea(
          child: SizedBox(
            width: size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                CongratsCard(
                    size: size,
                    subtitle: 'Acabas de ganar $points pts',
                    children: const [
                      SizedBox(height: 32),
                      Text(
                        'Gracias por contestar nuestra encuesta',
                        style: TextStyle(
                            fontSize: 24.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 32),
                    ]),
                const SizedBox(
                  height: 24.0,
                ),
                const Text('13,482 pts', style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.0,
                    decoration: TextDecoration.lineThrough
                ),),
                const SizedBox(
                  height: 10.0,
                ),
                Text('+$points pts', style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0
                ),),
                const SizedBox(
                  height: 10.0,
                ),
                Text('13,502 pts', style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 24.0,
                  color: secondary
                ),),
                Expanded(child: Container(),),
                btn,
                const SizedBox(
                  height: 18.0,
                ),
              ],
            ),
          ),
        ));
  }
}
