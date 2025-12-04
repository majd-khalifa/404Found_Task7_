import 'package:flutter/material.dart';
import 'app_shadows.dart';

class AppDecorations {
  static BoxDecoration whiteBox({double radius = 14}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: AppShadows.light,
    );
  }

  static BoxDecoration coloredBox(Color color, {double radius = 14}) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  static BoxDecoration flatBox({
    double radius = 14,
    Color color = Colors.white,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    );
  }
}
