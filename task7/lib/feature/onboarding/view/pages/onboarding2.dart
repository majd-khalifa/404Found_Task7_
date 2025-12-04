import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Onboarding2 extends StatelessWidget {
  const Onboarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 1.sh,
      color: Color(0xff282828),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  maxLines: 1,
                  "Let’s Start Journey",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.ralewayBold(
                    color: Color(0xffECECEC),
                    fontSize: 34.sp,
                    height: (44.2.h / 34.sp),
                  ),
                ),
                75.verticalSpace,
                Text(
                  maxLines: 2,

                  "Smart, Gorgeous & Fashionable\n Collection Explor Now",
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

          Positioned(
            top: 116.h,
            left: 27.w,
            child: SvgPicture.asset(
              "assets/icons/Highlight_10.svg",
              color: mywhite,
            ),
          ),
          Positioned(
            top: 113.h,
            right: 26.w,
            child: SvgPicture.asset("assets/icons/Misc_04.svg", color: mywhite),
          ),
        ],
      ),
    );
  }
}
