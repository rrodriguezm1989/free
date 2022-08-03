import 'package:dandy/common/constants/components/counter_component.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:flutter/material.dart';

class NumberSchema extends StatefulWidget {
  final Question question;
  final Function()? onUpdate;

  const NumberSchema({Key? key, required this.question, this.onUpdate}) : super(key: key);

  @override
  State<NumberSchema> createState() => _NumberSchemaState();
}

class _NumberSchemaState extends State<NumberSchema> {
  @override
  void initState() {
    super.initState();
    widget.question.ans = 1;
    widget.question.validate = () {
      return widget.question.ans != null;
    };
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: CounterButton(
          counter: widget.question.ans.toString(),
          onRemovePressed: () {
            if ((widget.question.ans as int) == 1) return;
            widget.question.ans = (widget.question.ans as int) - 1;
            if(widget.onUpdate != null) widget.onUpdate!();
            setState(() {});
          },
          onAddPressed: () {
            if ((widget.question.ans as int) >= 99) return;
            widget.question.ans = (widget.question.ans as int) + 1;
            if(widget.onUpdate != null) widget.onUpdate!();
            setState(() {});
          },
          withRoundedBorder: true,
          width: 155,
        ),
      ),
    );
  }
}
