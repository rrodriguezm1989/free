// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:dandy/common/constants/utils/constant_colors.dart'
    as constantColors;
import 'package:dandy/common/constants/utils/constant_dimension.dart'
    as constantDimension;

// ignore: must_be_immutable
class DropdownInput extends StatefulWidget {
  double widthField = 200;
  String hintText = "";
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  var listItems;

  String dropdownvalue = "no value";
  DropdownInput(
      {Key? key,
      required this.widthField,
      required this.hintText,
      required this.items})
      : super(key: key) {
    listItems = items.map((String items) {
      return DropdownMenuItem(
        value: items,
        child: Text(
          items,
          style: TextStyle(color: constantColors.greyInputText),
        ),
      );
    }).toList();
    if (items[0].runtimeType == String) {
      dropdownvalue = items[0];
    } else {
      dropdownvalue = "no value";
    }
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
        height: constantDimension.heightInputs,
        child: InputDecorator(
          decoration: InputDecoration(
              labelText: '',
              hintText: widget.hintText,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: constantColors.greyInputBackground, width: 0.0),
                  borderRadius: BorderRadius.circular(45.0)),
              filled: true,
              contentPadding: const EdgeInsets.only(left: 20.0, right: 2.0),
              fillColor: constantColors.greyInputBackground,
              floatingLabelBehavior: FloatingLabelBehavior.always),
          child: /*DropdownButton(
              items: widget.listItems,
              onChanged: (String? newValue) {
                setState(() {
                  widget.dropdownvalue = newValue!;
                });
              },
              underline: const SizedBox(),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),
              style: const TextStyle(color: Colors.black),
            )
            */
              DropdownButton(
            // Initial Value

            underline: const SizedBox(),
            value: widget.dropdownvalue,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            // Array list of items
            items: widget.listItems,
            // After selecting the desired option,it will
            // change button value to selected value
            onChanged: (String? newValue) {
              setState(() {
                widget.dropdownvalue = newValue!;
              });
            },
            style: const TextStyle(color: Colors.black),
          ),
        ));
  }
}
