// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> light = [
    BoxShadow(
      color: Colors.black.withOpacity(0.06),
      blurRadius: 6,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> medium = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 10,
      offset: const Offset(0, 6),
    ),
  ];

  static List<BoxShadow> heavy = [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];
}
