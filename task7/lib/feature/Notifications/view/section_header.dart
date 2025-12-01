import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Sectionheader extends StatelessWidget {
  const Sectionheader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 61.w,
      height: 22.h,
      child: Text(
        title,
        style: AppTextStyles.ralewaySemiBold(
          color: myblack,
          fontSize: 18.sp,
          height: (22.h / 18.sp),
        ),
      ),
    );
  }
}
