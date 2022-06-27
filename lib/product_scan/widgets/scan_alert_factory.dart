import 'package:dandy/common/constants/utils/constant_colors.dart';
import 'package:flutter/material.dart';

enum AlertType { TEXT, COUNT_DOWN }
abstract class ScanAlertFactory {

  static Widget showAlert(double width, String msg, AlertType alertType, [String counter = "", Function? onRemovePressed, Function? onAddPressed]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: width,
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  msg,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              if (alertType == AlertType.COUNT_DOWN)
                TextButton(
                    onPressed: () => onRemovePressed!(),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    )),
              if (alertType == AlertType.COUNT_DOWN)
                Text(
                  counter,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
              if (alertType == AlertType.COUNT_DOWN)
                TextButton(
                    onPressed: () => onAddPressed!(),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
              color: principal),
        ),
      ],
    );
  }
}