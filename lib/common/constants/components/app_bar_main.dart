import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:flutter/material.dart';

AppBar mainAppBar(String title, bool isPrincipal) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
      title,
      style: TextStyle(fontSize: 15, color: isPrincipal? principal : secondary),
    ),
  );
}
