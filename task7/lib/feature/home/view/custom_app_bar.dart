import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import '../../../core/widgets/app_icon.dart';

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
            const AppIcon(
              asset: 'assets/icons/Hamburger.svg',
              width: 25.7,
              height: 18,
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
                const Positioned(
                  top: -10,
                  left: -16,
                  child: AppIcon(
                    asset: 'assets/icons/Highlight_05.svg',
                    width: 18,
                    height: 19,
                  ),
                ),
              ],
            ),

            const Spacer(flex: 2),

            AppIcon(
              asset: 'assets/icons/bag.svg',
              width: 44,
              height: 44,
              onTap: () {
                Navigator.pushNamed(context, '/cart');
              },
            ),
          ],
        ),
      ),
    );
  }
}
