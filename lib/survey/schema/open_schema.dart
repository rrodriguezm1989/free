import 'package:dandy/common/constants/components/typical_input.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:flutter/material.dart';

class OpenSchema extends StatefulWidget {
  final Question question;

  final Function()? onUpdate;

  const OpenSchema({Key? key, required this.question, this.onUpdate})
      : super(key: key);

  @override
  State<OpenSchema> createState() => _OpenSchemaState();
}

class _OpenSchemaState extends State<OpenSchema> {
  @override
  void initState() {
    super.initState();
    widget.question.ans = "";
    widget.question.validate = () {
      return widget.question.ans != null &&
          (widget.question.ans as String).isNotEmpty;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Center(
          child: TypicalInput(
        hintText: "Ingrese su respuesta aquí...",
        typeField: "multiline",
        height: 200.0,
        onChange: (ans) {
          if (widget.onUpdate != null) widget.onUpdate!();
          widget.question.ans = ans;
        },
      )),
    );
  }
}
