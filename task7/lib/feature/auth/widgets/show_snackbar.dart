
import 'package:flutter/material.dart';
import 'package:task7/core/style/colors/color.dart';

class Snackbar {
  static void show(
    BuildContext context,
    String message, {
    Color backgroundColor =myred,
    Color textColor =mywhite,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        duration: duration,
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
