import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;
import 'package:dandy/common/constants/utils/constant_dimension.dart'
    as constantDimension;

// ignore: must_be_immutable
class TypicalInput extends StatelessWidget {
  String hintText = "";
  String typeField = "text";
  double widthField = 1.0;

  TypicalInput(this.hintText, this.typeField, this.widthField, {Key? key})
      : super(key: key);

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
        height: constantDimension.heightInputs,
        child: TextField(
            obscureText: secret,
            decoration: InputDecoration(
                labelText: '',
                hintText: hintText,
                hintStyle: TextStyle(color: constantColors.greyInputText),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: constantColors.greyInputBackground, width: 0.0),
                    borderRadius: BorderRadius.circular(45.0)),
                filled: true,
                //fillColor: Colors.red,
                contentPadding: const EdgeInsets.only(
                    left: 28.0, right: 28.0, top: 15.0, bottom: 15.0),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: constantColors.purple, width: 2.0),
                    borderRadius: BorderRadius.circular(45.0)),
                fillColor: constantColors.greyInputBackground,
                floatingLabelBehavior: FloatingLabelBehavior.always),
            keyboardType: inputType,
            inputFormatters: inputFormatters));
  }
}
