// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppDecorations {
  static BoxDecoration whiteBox({double radius = 14}) {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 6,
          offset: const Offset(0, 4),
        ),
      ],
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
