import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:flutter/material.dart';

class OptionSchema extends StatefulWidget {
  final Question question;
  const OptionSchema({Key? key, required this.question}) : super(key: key);

  @override
  State<OptionSchema> createState() => _OptionSchemaState();
}

class _OptionSchemaState extends State<OptionSchema> {

  @override
  void initState() {
    super.initState();
    widget.question.validate = () {
      return widget.question.ans != null;
    };
  }

  @override
  Widget build(BuildContext context) {
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
}
