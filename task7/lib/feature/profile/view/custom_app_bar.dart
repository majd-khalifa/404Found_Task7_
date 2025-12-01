
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../core/style/textstyle.dart';
// import '../../home/view/home_page.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  

//   const CustomAppBar({super.key});

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
//               "Profile",
//               style: AppTextStyles.ralewaySemiBold(
//                 fontSize: 20.sp,
//                 color: const Color(0xFF2B2B2B),
//               ),
//               overflow: TextOverflow.ellipsis,
//             ),
           
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(56.h);
// }
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/feature/search/view/search_page.dart';
import '../../../core/style/textstyle.dart';
import '../../home/view/home_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // زر الرجوع مع خلفية رمادية فاتحة
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                    context,//Home Page
                    MaterialPageRoute(builder: (_) => const SearchPage()),
                  );
                },
                child: SvgPicture.asset(
                    'assets/icons/go_back.svg',
                    width: 24.w,
                    height: 24.h,
                    color: const Color(0xFFF7F7F9),
                  ),
              ),
            ),

            // العنوان في المنتصف
            Text(
              "Profile",
              style: AppTextStyles.ralewaySemiBold(
                fontSize: 20.sp,
                color: const Color(0xFF2B2B2B),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
