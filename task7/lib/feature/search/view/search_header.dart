// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// class SearchHeader extends StatefulWidget {
//   const SearchHeader({super.key});

//  static get controller => null;

//   @override
//   State<SearchHeader> createState() => _SearchHeaderState();
// }

// class _SearchHeaderState extends State<SearchHeader> {
//   TextEditingController controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 4.0.w),
//       child: SizedBox(
//         height: 56.0.h,
//         child: Row(
//           children: [
//             Expanded(
//               child: Material(     // <── تم إضافة هذا فقط
//                 color: Colors.transparent,
//                 child: Container(
//                   height: 48.0.h,
//                   padding: EdgeInsets.symmetric(horizontal: 20.0.w),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12.0.r),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.06),
//                         blurRadius: 6.0.r,
//                         offset: Offset(0, 4.0.h),
//                       ),
//                     ],
//                   ),
//                   child: Row(
//                     children: [
//                       SvgPicture.asset(
//                         'assets/icons/search.svg',
//                         width: 14.33.w,
//                         height: 14.33.h,
//                       ),
//                       SizedBox(width: 12.0.w),

//                       Expanded(
//                         child: TextField(
//                           controller: controller,
//                           decoration: const InputDecoration(
//                             hintText: "Search Your Shirt",
//                             hintStyle: const TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w500,
//                             fontFamily: 'Raleway',
//                             color: Color(0xFF6A6A6A), // اختياري فقط ليظهر بشكل أوضح
//     ),
//                             border: InputBorder.none,
//                           ),
//                         ),
//                       ),
//                       //search_mic
//                        SvgPicture.asset(
//                         'assets/icons/search_mic.svg',
//                         width: 14.w,
//                         height: 20.h,
//                       ),
//                       // IconButton(
//                       //   icon: const Icon(Icons.mic_none, color: Colors.black),
//                       //   onPressed: () {},
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchHeader extends StatelessWidget {
  final TextEditingController controller;

  const SearchHeader({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.0.h,

      child: Row(
        children: [
          Expanded(
            child: Material(
              // <── تم إضافة هذا فقط
              color: Colors.transparent,
              child: Container(
                height: 48.0.h,
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 6.0.r,
                      offset: Offset(0, 4.0.h),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 14.33.w,
                      height: 14.33.h,
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: TextField(
                        controller: controller,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Search Your Shirt",
                          hintStyle: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Raleway',
                            color: Color(0xFF6A6A6A),
                            height: 2.0, // ← يجعل النص في الوسط 100%
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),

                    /// الخط العمودي قبل أيقونة المايك
                    Container(
                      width: 1,
                      height: 24,
                      color: Colors.grey.withOpacity(0.5),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),

                    /// أيقونة المايك
                    SvgPicture.asset(
                      'assets/icons/search_mic.svg',
                      width: 14.w,
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // child: Row(
      //   children: [
      //     Expanded(
      //       child: TextField(
      //         controller: controller, // ✅ نفس الـ controller
      //         decoration: const InputDecoration(
      //           hintText: "Search Your Shirt",
      //           border: InputBorder.none,
      //         ),
      //       ),
      //     ),
      //     SvgPicture.asset(
      //       'assets/icons/search_mic.svg',
      //       width: 14.w,
      //       height: 20.h,
      //     ),
      //   ],
      // ),
    );
  }
}
