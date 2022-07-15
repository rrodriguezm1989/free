import 'package:dandy/Authentication/services/authentication_services.dart';
import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/survey/models/point_holder.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:dandy/survey/schema/schema.dart';
import 'package:dandy/survey/utils/question_type.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenQuestion extends StatefulWidget {
  const ScreenQuestion({Key? key}) : super(key: key);

  @override
  State<ScreenQuestion> createState() => _ScreenQuestionState();
}

class _ScreenQuestionState extends State<ScreenQuestion> {
  late SurveyHolder survey;
  late List<Question> questions;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    survey = ModalRoute.of(context)!.settings.arguments as SurveyHolder;
    questions = survey.questions;
    final size = MediaQuery.of(context).size;

    final appBar = AppBar(
      backgroundColor: secondary,
      elevation: 0,
      title: Text(
        'Responde y gana',
        style: TextStyle(fontSize: 15, color: principal),
      ),
    );

    final controller = PageController(viewportFraction: 1);

    //Validates according to the selected schema for each page change request.
    controller.addListener(() {
      if(!questions[page].validate!()) {
        controller.jumpToPage(page);
      }
    });

    final indicator = SmoothPageIndicator(
      controller: controller,
      count: questions.length,
      effect: ScrollingDotsEffect(activeDotColor: whiteGrey),
    );

    final btn = LargeButton(
      text: page == (questions.length - 1) ? 'Finalizar' : 'Siguiente',
      color: page == (questions.length - 1) ? principal : Colors.grey,
      fontColor: secondary,
      height: 58.0,
      width: size.width,
      onPress: () {
        if (page != (questions.length - 1)) {
          controller.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.ease);
          return;
        }
        if(!questions[page].validate!()) {
          controller.jumpToPage(page);
          return;
        }
        Navigator.of(context).pushNamed('/survey/1',
            arguments: PointHolder(
              addingPoints: survey.points,
              currentPoints:
                  (Provider.of<AuthenticationServices>(context, listen: false))
                      .points,
            ));
      },
    );

    return Scaffold(
      backgroundColor: secondary,
      appBar: appBar,
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: Column(
          children: [
            Expanded(
                child: PageView(
              onPageChanged: (index) {
                page = index;
                setState(() {});
              },
              controller: controller,
              children: [
                for (var question in questions)
                  _SurveyTab(
                    question: question,
                    size: size,
                  ),
              ],
            )),
            indicator,
            const SizedBox(
              height: 24,
            ),
            btn,
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class _SurveyTab extends StatefulWidget {
  final Question question;
  final Size size;

  const _SurveyTab({Key? key, required this.size, required this.question})
      : super(key: key);

  @override
  State<_SurveyTab> createState() => _SurveyTabState();
}

//Setups a new tab, assigning a schema according to the question type
class _SurveyTabState extends State<_SurveyTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: widget.size.width * .9,
          height: widget.size.width * .5,
          child: Container(),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.size.width * .05),
              image: DecorationImage(
                  image: NetworkImage(widget.question.url), fit: BoxFit.cover)),
        ),
        const SizedBox(height: 24),
        Text(
          widget.question.question,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 10),
        if (widget.question.type == QuestionType.FACES)
          FaceSchema(question: widget.question),
        if (widget.question.type == QuestionType.RADIO)
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: OptionSchema(question: widget.question),
          ),
        if (widget.question.type == QuestionType.STAR)
          StarSchema(question: widget.question),
        if (widget.question.type == QuestionType.LIKES)
          ThumbsSchema(question: widget.question),
        if (widget.question.type == QuestionType.SELECTION)
          SelectionSchema(question: widget.question),
        if(widget.question.type == QuestionType.NUMBER)
          NumberSchema(question: widget.question),
        if(widget.question.type == QuestionType.OPEN)
          OpenSchema(question: widget.question),

      ],
    );
  }
}
