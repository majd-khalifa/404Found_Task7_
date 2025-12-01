// ignore_for_file: prefer_null_aware_operators

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SparkleIcon extends StatelessWidget {
  final double top;
  final double? left;
  final double? right;

  const SparkleIcon({super.key, required this.top, this.left, this.right});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top.h,
      left: left != null ? left!.w : null,
      right: right != null ? right!.w : null,
      child: Image.asset(
        'assets/icons/sparkle.png',
        width: 15.48.w,
        height: 16.72.w,
        color: const Color(0xFF000042),
      ),
    );
  }
}
