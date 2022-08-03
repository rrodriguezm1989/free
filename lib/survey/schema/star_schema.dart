import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:flutter/material.dart';

class StarSchema extends StatefulWidget {
  final Question question;

  final Function()? onUpdate;

  const StarSchema({Key? key, required this.question, this.onUpdate}) : super(key: key);

  @override
  State<StarSchema> createState() => _StarSchemaState();
}

class _StarSchemaState extends State<StarSchema> {

  @override
  void initState() {
    super.initState();
    widget.question.ans ??= <int, int>{};
    widget.question.validate = () {
      for (var question in widget.question.answerList!.entries) {
        if((widget.question.ans as Map<int, int>)[question.key] == null) {
          return false;
        }
      }
      return true;
    };
  }

  @override
  Widget build(BuildContext context) {
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
        if(widget.onUpdate != null) widget.onUpdate!();
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
}
