import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SizedBox(
        height: 44.h,
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/icons/Hamburger.svg',
              width: 25.71428680419922.w,
              height: 18.h,
            ),

            const Spacer(flex: 2),

            Stack(
              clipBehavior: Clip.none,
              children: [
                Text(
                  "Explore",
                  style: AppTextStyles.ralewayBold(
                    fontSize: 32,
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                Positioned(
                  top: -10.0.h,
                  left: -16.0.w,
                  child: SvgPicture.asset(
                    'assets/icons/Highlight_05.svg',
                    width: 18.0.w,
                    height: 19.0.h,
                  ),
                ),
              ],
            ),

            const Spacer(flex: 2),

            SvgPicture.asset(
              'assets/icons/bag.svg',
              width: 44.0.w,
              height: 44.0.w,
            ),
          ],
        ),
      ),
    );
  }
}
