import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
as constantColors;
import 'package:dandy/common/constants/utils/constant_dimension.dart'
as constantDimension;

// ignore: must_be_immutable
class TypicalInput extends StatelessWidget {
  final hintText;
  final typeField;
  final widthField;
  final height;
  final controller;
  final Function(String)? onChange;
  final Widget? prefix;

  const TypicalInput({Key? key, this.hintText,
    this.typeField,
    this.widthField,
    this.height,
    this.controller,
    this.onChange,
    this.prefix
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextInputType inputType =
    typeField == "number" ? TextInputType.number : TextInputType.name;
    var inputFormatters = typeField == "number"
        ? <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly]
        : null;
    bool secret = typeField == "password" ? true : false;

    return SizedBox(
        width: widthField,
        height: height,
        child: TextField(
            obscureText: secret,
            controller: controller,
            onChanged: onChange,
            maxLines: typeField == TextInputType.multiline ? 10 : 1,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                labelText: '',
                hintText: hintText,
                hintStyle: TextStyle(color: constantColors.whiteGrey),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: constantColors.whiteGrey, width: 0.0),
                    borderRadius: BorderRadius.circular(45.0)),
                filled: false,
                prefix: prefix,
                contentPadding: const EdgeInsets.only(
                    left: 28.0, right: 28.0, top: 15.0, bottom: 15.0),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: constantColors.whiteGrey, width: 2.0),
                    borderRadius: BorderRadius.circular(45.0)),
                floatingLabelBehavior: FloatingLabelBehavior.always),
            keyboardType: inputType,
            inputFormatters: inputFormatters));
  }
}
