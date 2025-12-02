import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Mybottom extends StatelessWidget {
  final Widget widget;
  final Future Function()? onPressed;
  final Color color;
  const Mybottom({super.key, required this.widget, required this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        fixedSize: Size(1.sw, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(13.r),
        ),
      ),

      onPressed: onPressed,
      child: widget,
    );
  }
}
