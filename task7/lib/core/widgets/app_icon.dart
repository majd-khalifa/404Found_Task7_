// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final VoidCallback? onTap;
  final Color? color; // ✅ إضافة اللون

  const AppIcon({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.onTap,
    this.color, // ✅ باراميتر اللون
  });

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset(
      asset,
      width: width?.w,
      height: height?.h,
      color: color, // ✅ تطبيق اللون
    );

    return onTap != null ? GestureDetector(onTap: onTap, child: icon) : icon;
  }
}
