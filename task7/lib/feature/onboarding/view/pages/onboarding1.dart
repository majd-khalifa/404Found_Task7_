// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Onboarding1 extends StatelessWidget {
  const Onboarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Color(0xff282828),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 19.w, right: 20.w),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "WELCOME TO \nBYTE BOUTIQUE",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ralewayBlack(
                      color: Color(0xffECECEC),
                      fontSize: 30.sp,
                      height: 1.h,
                    ),
                  ),
                  19.verticalSpace,
                  SvgPicture.asset("assets/icons/Vector.svg"),
                ],
              ),
            ),
          ),
          Positioned(
            top: 65.h,
            left: 59.w,
            child: SvgPicture.asset(
              "assets/icons/Highlight_1.svg",
              color: mywhite,
            ),
          ),
          Positioned(
            top: 124.h,
            right: 71.w,
            child: SvgPicture.asset("assets/icons/Misc_04.svg", color: mygray),
          ),
          Positioned(
            bottom: 165.51.h,
            right: 30.07.w,
            child: SvgPicture.asset(
              "assets/icons/Highlight_10.svg",
              color: mygray,
            ),
          ),
          Positioned(
            bottom: 95.62.h,
            left: 29.w,
            child: SvgPicture.asset(
              "assets/icons/Highlight_10 (1).svg",
              color: mygray,
            ),
          ),
        ],
      ),
    );
  }
}
