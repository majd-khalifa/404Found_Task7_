import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class AppIcon extends StatelessWidget {
  final String asset;
  final double? width;
  final double? height;
  final VoidCallback? onTap;

  const AppIcon({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset(asset, width: width?.w, height: height?.h);
    return onTap != null ? GestureDetector(onTap: onTap, child: icon) : icon;
  }
}
