import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Sectionheader extends StatelessWidget {
  const Sectionheader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: AppTextStyles.ralewaySemiBold(
            color: myblack,
            fontSize: 18.sp,
            height: 1.2,
          ),
          overflow: TextOverflow.visible,
          softWrap: true,
        ),
      ),
    );
  }
}
