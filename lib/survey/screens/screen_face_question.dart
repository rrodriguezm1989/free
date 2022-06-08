import 'package:dandy/common/constants/components/large_button.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:dandy/survey/utils/question_type.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ScreenQuestion extends StatefulWidget {
  const ScreenQuestion({Key? key}) : super(key: key);

  @override
  State<ScreenQuestion> createState() => _ScreenQuestionState();
}

class _ScreenQuestionState extends State<ScreenQuestion> {
  late List<Question> questions;
  int page = 0;

  @override
  Widget build(BuildContext context) {
    //questions = ModalRoute.of(context)!.settings.arguments as List<Question>;
    questions = [
      Question(
          question: 'Duda uno?',
          url:
              'https://images.pexels.com/photos/12079516/pexels-photo-12079516.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          type: QuestionType.FACES),
      Question(
          question: 'Duda dos?',
          url:
              'https://images.pexels.com/photos/12079516/pexels-photo-12079516.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          type: QuestionType.STAR,
          answerList: {
            0: 'Empaque',
            1: 'Color',
            2: 'Sabor',
          }),
      Question(
          question: 'Duda tres?',
          url:
              'https://images.pexels.com/photos/12079516/pexels-photo-12079516.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          type: QuestionType.LIKES),
    ];
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
      count: questions.length,
      effect: const WormEffect(),
    );

    final btn = LargeButton(
      text: 'Siguiente',
      color: page == (questions.length - 1) ? principal : Colors.grey,
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
        if (widget.question.type == QuestionType.FACES) getFaceSchema(),
        if (widget.question.type == QuestionType.RADIO)
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: getOptionSchema(),
          ),
        if (widget.question.type == QuestionType.STAR) getStarSchema(),
        if (widget.question.type == QuestionType.LIKES) getThumbsSchema(),
      ],
    );
  }

  Widget getOptionSchema() {
    return Column(
      children: [
        for (var option in widget.question.answerList!.entries)
          ListTile(
            title: Text(
              option.value,
              style: const TextStyle(color: Colors.white),
            ),
            leading: Radio<int>(
              value: option.key,
              groupValue: widget.question.ans,
              onChanged: (vl) {
                widget.question.ans = vl ?? 0;
                setState(() {});
              },
              fillColor: MaterialStateColor.resolveWith((states) =>
                  widget.question.ans == option.key ? principal : Colors.white),
            ),
          ),
      ],
    );
  }

  Widget getStarSchema() {
    widget.question.ans ??= <int, int>{};
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var question in widget.question.answerList!.entries)
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.value,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if ((widget.question.ans as Map<int, int>)[question.key] ==
                        null)
                      for (int i = 0; i < 5; i++)
                        addStar(question.key, i, whiteGrey),
                    if ((widget.question.ans as Map<int, int>)[question.key] !=
                        null)
                      for (int i = 0;
                          i <
                              (widget.question.ans
                                  as Map<int, int>)[question.key]!;
                          i++)
                        addStar(question.key, i, principal),
                    if ((widget.question.ans as Map<int, int>)[question.key] !=
                        null)
                      for (int i = (widget.question.ans
                              as Map<int, int>)[question.key]!;
                          i < 5;
                          i++)
                        addStar(question.key, i, greyText),
                  ],
                )
              ],
            ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(.1),
          border: Border.all(
              style: BorderStyle.solid, width: 1.0, color: Colors.white)),
    );
  }

  Widget addStar(int key, int index, Color color) {
    return TextButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(const Size(25, 25)),
      ),
      onPressed: () {
        final ans = (widget.question.ans as Map<int, int>);
        if ((widget.question.ans as Map<int, int>)[key] != null &&
            (widget.question.ans as Map<int, int>)[key]! == (index + 1)) {
          ans[key] = 0;
          widget.question.ans = ans;
        } else {
          ans[key] = (index + 1);
          widget.question.ans = ans;
        }
        setState(() {});
      },
      child: Center(
        child: Icon(
          Icons.star_rounded,
          size: 25,
          color: color,
        ),
      ),
    );
  }

  Widget getThumbsSchema() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () {
              widget.question.ans = false;
              setState(() {});
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(64, 64))),
            child: RotatedBox(
                quarterTurns: 2,
                child: Opacity(
                  opacity: widget.question.ans == false ? 1 : 0.4,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: const Image(
                      image: AssetImage('assets/images/thumb.png'),
                      fit: BoxFit.scaleDown,
                      width: 54,
                      height: 54,
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                        gradient: const RadialGradient(colors: [
                          Color(0x77EBEBEF),
                          Color(0x00EBEBEF),
                        ]),
                        borderRadius: BorderRadius.circular(38),
                        border: widget.question.ans == false
                            ? Border.all(color: principal, width: 1.0)
                            : null),
                  ),
                )),
          ),
          TextButton(
            onPressed: () {
              widget.question.ans = true;
              setState(() {});
            },
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(64, 64))),
            child: Opacity(
              opacity: widget.question.ans == true ? 1 : 0.4,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: const Image(
                  image: AssetImage('assets/images/thumb.png'),
                  fit: BoxFit.scaleDown,
                  width: 54,
                  height: 54,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                    gradient: const RadialGradient(colors: [
                      Color(0x77EBEBEF),
                      Color(0x00EBEBEF),
                    ]),
                    borderRadius: BorderRadius.circular(38),
                    border: widget.question.ans == true
                        ? Border.all(color: principal, width: 1.0)
                        : null),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getFaceSchema() {
    return SizedBox(
      width: widget.size.width,
      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            getFace('smiley', AnswerFace.smiley),
            getFace('yawn', AnswerFace.yawn),
            getFace('sad', AnswerFace.sad),
          ]),
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
        image: AssetImage('assets/images/${face}_face_selected.png'),
        color: Colors.white.withOpacity(widget.question.ans == ans ? 1 : 0.4),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}
