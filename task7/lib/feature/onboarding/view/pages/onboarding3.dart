// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
                    maxLines: 2,
                    "You Have the \nPower To",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ralewaySemiBold(
                      color: Color(0xffECECEC),
                      fontSize: 34.sp,
                      height: (44.2.h / 34.sp),
                    ),
                  ),
                  30.verticalSpace,
                  Text(
                    maxLines: 2,

                    "There Are Many Beautiful And Attractive\n Plants To Your Room",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.poppinsRegular(
                      color: Color(0xffD8D8D8),
                      fontSize: 16.sp,
                      height: (24.h / 16.sp),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 108.h,
            left: 52.w,
            child: SvgPicture.asset(
              "assets/icons/Misc_04.svg",
              color: mywhite,
              height: 77.h,
              width: 77.w,
            ),
          ),
        ],
      ),
    );
  }
}
