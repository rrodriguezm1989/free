import 'package:flutter/material.dart';

class FloatingActionButtonStar extends StatefulWidget {
  final index;

  FloatingActionButtonStar({
    required this.index,
  });
  @override
  State<StatefulWidget> createState() {
    return _FloatingActionButtonStar();
  }
}

class _FloatingActionButtonStar extends State<FloatingActionButtonStar> {
  bool starConfirm = true;
  void onSelected() {
    setState(() {
      starConfirm = !starConfirm;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFFec4f0c),
      mini: true,
      tooltip: "Fav",
      onPressed: onSelected,
      heroTag: widget.index,
      child: const Icon(Icons.star),
    );
  }
}
