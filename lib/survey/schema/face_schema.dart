import 'package:dandy/survey/models/question_model.dart';
import 'package:flutter/material.dart';

class FaceSchema extends StatefulWidget {
  final Question question;
  final Function()? onUpdate;

  const FaceSchema({Key? key, required this.question, this.onUpdate})
      : super(key: key);

  @override
  State<FaceSchema> createState() => _FaceSchemaState();
}

class _FaceSchemaState extends State<FaceSchema> {
  late Size size;

  @override
  void initState() {
    super.initState();
    widget.question.validate = () {
      return widget.question.ans != null;
    };
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
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
        if(widget.onUpdate != null) widget.onUpdate!();
        setState(() {});
      },
      child: Image(
        width: (size.width / 5),
        height: (size.width / 5),
        image: AssetImage('assets/images/${face}_face_selected.png'),
        color: Colors.white.withOpacity(widget.question.ans == ans ? 1 : 0.4),
        colorBlendMode: BlendMode.modulate,
      ),
    );
  }
}
