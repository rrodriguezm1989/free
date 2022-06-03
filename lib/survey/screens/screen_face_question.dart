import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenFaceQuestion extends StatefulWidget {
  final List<Question> questions;

  const ScreenFaceQuestion({Key? key, required this.questions})
      : super(key: key);

  @override
  State<ScreenFaceQuestion> createState() => _ScreenFaceQuestionState();
}

class _ScreenFaceQuestionState extends State<ScreenFaceQuestion> {
  int page = 0;

  @override
  Widget build(BuildContext context) {
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

    final indicator = SmoothPageIndicator(
      controller: controller,
      count: widget.questions.length,
      effect: const WormEffect(),
    );


    final btn = LargeButton(
      text: 'Siguiente',
      color: page == (widget.questions.length - 1) ? principal : Colors.grey,
      fontColor: secondary,
      height: 58.0,
      width: size.width,
      onPress: () => {},
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
                for (var question in widget.questions)
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
        SizedBox(
          width: widget.size.width,
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                getFace('smiley', AnswerFace.smiley),
                getFace('yawn', AnswerFace.yawn),
                getFace('sad', AnswerFace.sad),
              ]),
        ),
      ],
    );
  }

  Widget getFace(String face, AnswerFace ans) {
    return TextButton(
      onPressed: () {
        widget.question.ans = ans;
        setState(() {});
      },
      child: Image(
        width: (widget.size.width / 5),
        height: (widget.size.width / 5),
        image: AssetImage(
            'assets/images/${face}_face${widget.question.ans == ans ? '_selected' : ''}.png'),
      ),
    );
  }
}
