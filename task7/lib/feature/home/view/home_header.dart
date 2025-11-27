// ignore_for_file: deprecated_member_use

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SearchBarWithFilter(),
        SizedBox(height: 24.0.h), // ✅ بدل h * 0.03
        const SelectCategoryRow(),
      ],
    );
  }
}

class SearchBarWithFilter extends StatelessWidget {
  const SearchBarWithFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0.w),
      child: SizedBox(
        height: 56.0.h,
        child: Row(
          children: [
            Expanded(
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
                      width: 20.0.w,
                      height: 20.0.h,
                    ),
                    SizedBox(width: 12.0.w),
                    Text(
                      "Looking for ......",
                      style: AppTextStyles.poppinsMedium(
                        fontSize: 14,
                        color: const Color(0xFF6A6A6A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 12.0.w),
            SvgPicture.asset(
              'assets/icons/filter.svg',
              width: 40.0.w,
              height: 40.0.h,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectCategoryRow extends StatelessWidget {
  const SelectCategoryRow({super.key});

  Future<List<String>> fetchCategories() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products"),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      final categories = data
          .map((item) => item["category"] as String)
          .toSet()
          .toList();
      return categories;
    } else {
      throw Exception("Failed to fetch categories");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16.0.h),
            alignment: Alignment.centerLeft,
            child: Text(
              "Select Category",
              style: AppTextStyles.ralewaySemiBold(
                fontSize: 16,
                color: const Color(0xFF2B2B2B),
              ),
            ),
          ),
          SizedBox(
            height: 40.0.h,
            child: FutureBuilder<List<String>>(
              future: fetchCategories(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Text("Error fetching categories");
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text("No categories found");
                }

                final categories = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: categories.map((label) {
                      return Padding(
                        padding: EdgeInsets.only(right: 16.0.w),
                        child: Container(
                          width: 108.0.w,
                          height: 40.0.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12.0.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.06),
                                blurRadius: 4.0.r,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            label,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.poppinsMedium(
                              fontSize: 12,
                              color: const Color(0xFF2B2B2B),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
