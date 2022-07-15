import 'package:flutter/material.dart';

class CounterButton extends StatefulWidget {
  final String counter;
  final Function onRemovePressed;
  final Function onAddPressed;
  final bool withRoundedBorder;
  final Color color;
  final double? width;

  const CounterButton(
      {Key? key,
      required this.counter,
      required this.onRemovePressed,
      required this.onAddPressed,
      this.withRoundedBorder = false,
      this.color = Colors.white,
      this.width})
      : super(key: key);

  @override
  State<CounterButton> createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => widget.onRemovePressed(),
              child: Icon(
                Icons.remove,
                color: widget.color,
              )),
          Text(
            widget.counter,
            style: TextStyle(
                color: widget.color, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          TextButton(
              onPressed: () => widget.onAddPressed(),
              child: Icon(
                Icons.add,
                color: widget.color,
              )),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius:
              widget.withRoundedBorder ? BorderRadius.circular(20) : null,
          border: widget.withRoundedBorder
              ? Border.all(width: 1.0, color: widget.color)
              : null),
    );
  }
}
