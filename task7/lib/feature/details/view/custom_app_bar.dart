import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/view/home_page.dart';
import '../../../core/style/textstyle.dart'; // ✅ استدعاء AppTextStyles

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w), // ✅ responsive
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: SvgPicture.asset(
                'assets/icons/go_back.svg',
                width: 32.w,
                height: 32.w,
              ),
            ),

            Text(
              "T-shirt Shop",
              style: AppTextStyles.ralewaySemiBold(
                fontSize: 18.sp, // ✅ responsive font
                color: const Color(0xFF2B2B2B),
              ),
              overflow: TextOverflow.ellipsis,
            ),

            SvgPicture.asset('assets/icons/bag.svg', width: 32.w, height: 32.w),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h); // ✅ responsive height
}
