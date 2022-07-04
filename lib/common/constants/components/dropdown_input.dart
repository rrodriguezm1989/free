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
  final onChange;
  final String? selectedItem;

  String dropdownvalue = "no value";
  DropdownInput(
      {Key? key,
      required this.widthField,
      required this.hintText,
      required this.items,
      required this.selectedItem,
      required this.onChange})
      : super(key: key) {
    listItems = items.map((String items) {
      return DropdownMenuItem(
        value: items,
        child: Text(
          items,
          style: TextStyle(
            color: constantColors.google,
            overflow: TextOverflow.fade,
          ),
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

  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.widthField,
        height: constantDimension.heightInputs,
        child: InputDecorator(
            decoration: InputDecoration(
                labelText: '',
                //hintText: widget.hintText,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: constantColors.greyInputBackground, width: 0.0),
                    borderRadius: BorderRadius.circular(45.0)),
                filled: false,
                contentPadding: const EdgeInsets.only(left: 20.0, right: 2.0),
                fillColor: constantColors.greyInputBackground,
                floatingLabelBehavior: FloatingLabelBehavior.always),
            child: Theme(
              data: Theme.of(context)
                  .copyWith(canvasColor: constantColors.secondary),
              child: DropdownButton(
                isExpanded: true,
                // Initial Value

                underline: const SizedBox(),
                value: _selectedItem,
                // Down Arrow Icon

                icon: const Icon(Icons.keyboard_arrow_down),
                // Array list of items
                items: widget.listItems,
                hint: Text(
                  widget.hintText,
                  style: TextStyle(
                    color: constantColors.google,
                    overflow: TextOverflow.fade,
                  ),
                ),
                //disabledHint: Text(widget.hintText),

                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  _selectedItem = newValue;
                  widget.onChange(newValue);
                },
                style: const TextStyle(
                  color: Colors.white,
                  overflow: TextOverflow.fade,
                ),
              ),
            )));
  }
}
