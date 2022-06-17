import 'package:dandy/common/constants/components/app_bar_main.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/common/model/product_model.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:dandy/survey/utils/mock_questions.dart';
import 'package:flutter/material.dart';

class ScreenScanProductDetail extends StatelessWidget {
  late Product product;
  final titleStyle =
      TextStyle(color: principal, fontSize: 24, fontWeight: FontWeight.w700);

  ScreenScanProductDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    product = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      backgroundColor: secondary,
      appBar: mainAppBar(product.title, true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            const SizedBox(height: 42),
            Text('+20 pts', style: titleStyle),
            const SizedBox(height: 24),
            Container(
              width: size.width * .9,
              height: size.width * .9 * .5,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(product.image)),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(height: 24),
            Text(product.title, style: titleStyle),
            const SizedBox(height: 10),
            Text(product.description,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                )),
            Expanded(child: Container()),
            LargeButton(
              text: 'Responde y gana puntos extra',
              color: principal,
              fontColor: secondary,
              width: size.width * .9,
              height: 60.0,
              tile: Icon(
                Icons.star_rounded,
                color: secondary
              ),
              onPress: () => {
                Navigator.of(context).pushNamed(
                  '/survey/0',
                  arguments: SurveyHolder(questions: questionsList, points: 20)
                )
              }
            ),
          ]),
        ),
      ),
    );
  }
}
