import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:flutter/material.dart';

class MoneySchema extends StatefulWidget {
  final Question question;
  final Function()? onUpdate;

  const MoneySchema({Key? key, required this.question, this.onUpdate})
      : super(key: key);

  @override
  State<MoneySchema> createState() => _MoneySchemaState();
}

class _MoneySchemaState extends State<MoneySchema> {
  @override
  void initState() {
    super.initState();
    widget.question.ans = "";
    widget.question.validate = () {
      return widget.question.ans != null &&
          (widget.question.ans as String).isNotEmpty &&
          checkDouble(widget.question.ans as String);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
          child: TypicalInput(
        hintText: "Ingrese la cifra...",
        typeField: "money",
        onChange: (ans) {
          if (widget.onUpdate != null) widget.onUpdate!();
          widget.question.ans = ans;
        },
        prefix: const Text(
          "Q ",
          style: TextStyle(color: Colors.white),
        ),
      )),
    );
  }

  bool checkDouble(String val) {
    try {
      double.parse(val);
      return true;
    } on Exception {
      return false;
    }
  }
}
