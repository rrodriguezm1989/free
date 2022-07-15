import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:flutter/material.dart';

class ThumbsSchema extends StatefulWidget {
  final Question question;
  final Function()? onUpdate;

  const ThumbsSchema({Key? key, required this.question, this.onUpdate})
      : super(key: key);

  @override
  State<ThumbsSchema> createState() => _ThumbsSchemaState();
}

class _ThumbsSchemaState extends State<ThumbsSchema> {
  @override
  void initState() {
    super.initState();
    widget.question.validate = () {
      return widget.question.ans != null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextButton(
            onPressed: () => onPress(false),
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
            onPressed: () => onPress(true),
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

  void onPress(bool ans) {
    widget.question.ans = ans;
    if (widget.onUpdate != null) widget.onUpdate!();
    setState(() {});
  }
}
