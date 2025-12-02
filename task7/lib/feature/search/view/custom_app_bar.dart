import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import '../../home/view/home_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;

  const CustomAppBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ✅ زر الرجوع مع خلفية رمادية فاتحة
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F7F9), // خلفية رمادية فاتحة
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(6.w),
                child: SvgPicture.asset(
                  'assets/icons/go_back.svg',
                  width: 24.w,
                  height: 24.h,
                  color: const Color(0xFFF7F7F9),
                ),
              ),
            ),

            // ✅ العنوان
            Text(
              "Search",
              style: AppTextStyles.ralewaySemiBold(
                fontSize: 20.sp,
                color: const Color(0xFF2B2B2B),
              ),
              overflow: TextOverflow.ellipsis,
            ),

            // ✅ زر الإلغاء
            TextButton(
              onPressed: () {
                controller.clear();
              },
              child: Text(
                "Cancel",
                style: AppTextStyles.ralewaySemiBold(
                  fontSize: 15.sp,
                  color: Colors.green,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../core/style/textstyle.dart';
// import '../../home/view/home_page.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final TextEditingController controller;

//   const CustomAppBar({super.key, required this.controller});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
      
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.w),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             GestureDetector(
//               onTap: () {
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (_) => const HomePage()),
//                 );
//               },
//               child: SvgPicture.asset(
//                 'assets/icons/go_back.svg',
//                 width: 32.w,
//                 height: 32.w,
//               ),
//             ),
//             Text(
//               "Search",
//               style: AppTextStyles.ralewaySemiBold(
//                 fontSize: 20.sp,
//                 color: const Color(0xFF2B2B2B),
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
//             TextButton(
//               onPressed: () {
//                 controller.clear(); // ✅ يمسح النص مباشرة
//               },
//               child: Text(
//                 "Cancel",
//                 style: AppTextStyles.ralewaySemiBold(
//                   fontSize: 15.sp,
//                   color: Colors.green,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(56.h);
// }
