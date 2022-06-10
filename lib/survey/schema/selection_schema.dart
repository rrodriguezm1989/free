import 'package:flutter/material.dart';
import 'package:dandy/survey/models/question_model.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constant_colors;
import 'package:dandy/common/constants/utils/constant_dimension.dart'
    as constant_dimension;

class SelectionSchema extends StatefulWidget {
  final Question question;

  const SelectionSchema({Key? key, required this.question}) : super(key: key);

  @override
  State<SelectionSchema> createState() => _SelectionSchemaState();
}

class _SelectionSchemaState extends State<SelectionSchema> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 25),
        DropdownInput(
          question: widget.question,
          widthField: size.width * .9,
          hintText: 'Seleccione una opción',
          controller: TextEditingController(),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class DropdownInput extends StatefulWidget {
  double widthField = 200;
  String hintText = "";
  var listItems;
  final TextEditingController controller;
  final Question question;

  DropdownInput({
    Key? key,
    required this.widthField,
    required this.hintText,
    required this.question,
    required this.controller,
  }) : super(key: key) {
    listItems = question.answerList!.values.map((String items) {
      return DropdownMenuItem(
        value: items,
        child: Text(
          items,
          style: const TextStyle(color: Colors.black),
        ),
      );
    }).toList();
    question.ans = question.answerList![0]!.runtimeType == String
        ? question.answerList![0]!
        : "no value";

    //this is to give initial value to controller
    controller.text = question.answerList![0]!;
  }

  @override
  _DropdownInputState createState() => _DropdownInputState();
}

class _DropdownInputState extends State<DropdownInput> {
  //_DropdownInputState(this.hintText, this.typeField, this.widthField);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.widthField,
        height: constant_dimension.heightInputs,
        child: InputDecorator(
          decoration: InputDecoration(
              labelText: '',
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: constant_colors.greyInputBackground, width: 1.0),
                  borderRadius: BorderRadius.circular(45.0)),
              filled: true,
              contentPadding: const EdgeInsets.only(left: 20.0, right: 2.0),
              fillColor: constant_colors.principal,
              floatingLabelBehavior: FloatingLabelBehavior.always),
          child: DropdownButton(
            // Initial Value

            underline: const SizedBox(),
            value: widget.question.ans! as String?,
            // Down Arrow Icon
            //icon: const Icon(Icons.keyboard_arrow_down),
            icon: const Padding(
                //Icon at tail, arrow bottom is default icon
                padding: EdgeInsets.only(right: 18),
                child: Icon(Icons.keyboard_arrow_down)),
            iconEnabledColor: constant_colors.greyInputBackground,
            //Icon color

            isExpanded: true,

            // Array list of items
            items: widget.listItems,
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                print('CHANGE VALUE WHY?');
                widget.question.ans = newValue!;
                widget.controller.text = newValue;
              });
            },
            style: const TextStyle(color: Colors.black),
          ),
        ));
  }
}
