// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/textstyle.dart';
import 'package:task7/core/style/app_decorations.dart';
import 'package:task7/core/widgets/app_icon.dart';

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
              color: Colors.transparent,
              child: Container(
                height: 52.0.h,
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                decoration: AppDecorations.whiteBox(radius: 14),
                child: Row(
                  children: [
                    const AppIcon(
                      asset: 'assets/icons/search.svg',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hintText: "Search Your Shirt",
                          hintStyle: AppTextStyles.poppinsMedium(
                            color: const Color(0xff6A6A6A),
                            fontSize: 12,
                          ),
                          border: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 24,
                      color: Colors.grey.withOpacity(0.5),
                      margin: EdgeInsets.symmetric(horizontal: 8),
                    ),
                    const AppIcon(
                      asset: 'assets/icons/search_mic.svg',
                      width: 14,
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
