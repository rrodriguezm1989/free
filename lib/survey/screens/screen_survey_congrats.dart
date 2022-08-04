import 'package:dandy/Authentication/services/authentication_services.dart';
import 'package:dandy/common/constants/components/congrats_card.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/survey/models/point_holder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SurveyCongrats extends StatelessWidget {
  const SurveyCongrats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<AuthenticationServices>(context);
    final points = ModalRoute.of(context)!.settings.arguments as PointHolder;
    if ((points.currentPoints) == service.points) {
      service.addPoints(points.addingPoints);
    }
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
      onPress: () {
        Navigator.pushNamedAndRemoveUntil(context, "/home", ModalRoute.withName('/'));
        //Navigator.of(context).popUntil((route) => route.settings.name == );
      },
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
                    subtitle: 'Acabas de ganar ${points.addingPoints} pts',
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
                Text(
                  '${points.currentPoints} pts',
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18.0,
                      decoration: TextDecoration.lineThrough),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '+${points.addingPoints} pts',
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 18.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  '${service.points} pts',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24.0,
                      color: secondary),
                ),
                Expanded(
                  child: Container(),
                ),
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
