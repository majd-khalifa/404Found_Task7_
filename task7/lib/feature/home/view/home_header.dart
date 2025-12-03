// ignore_for_file: deprecated_member_use

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/errors/error_message.dart';
import '../../../core/style/textstyle.dart';
import '../../../core/widgets/app_icon.dart';
import '../../../core/style/app_decorations.dart';

class HomeHeader extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String? selectedCategory;
  final VoidCallback onFilterPressed;
  final Function(String) onSearch;

  const HomeHeader({
    super.key,
    required this.onCategorySelected,
    this.selectedCategory,
    required this.onFilterPressed,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SearchBarWithFilter(
          onFilterPressed: onFilterPressed,
          onSearch: onSearch,
        ),
        SizedBox(height: 24.0.h),
        SelectCategoryRow(
          onCategorySelected: onCategorySelected,
          selectedCategory: selectedCategory,
        ),
      ],
    );
  }
}

class SearchBarWithFilter extends StatelessWidget {
  final VoidCallback onFilterPressed;
  final Function(String) onSearch;

  const SearchBarWithFilter({
    super.key,
    required this.onFilterPressed,
    required this.onSearch,
  });

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
                height: 52.0.h,
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                decoration: AppDecorations.whiteBox(radius: 14),
                child: Row(
                  children: [
                    // ✅ أيقونة السيرش مع onTap
                    AppIcon(
                      asset: 'assets/icons/search.svg',
                      width: 24,
                      height: 24,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/search',
                        ); // اسم الـ route
                      },
                    ),
                    SizedBox(width: 12.0.w),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "looking for .....",
                          border: InputBorder.none,
                        ),
                        onSubmitted: onSearch,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 14.0.w),
            AppIcon(
              asset: 'assets/icons/filter.svg',
              width: 52,
              height: 52,
              onTap: onFilterPressed,
            ),
          ],
        ),
      ),
    );
  }
}

class SelectCategoryRow extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String? selectedCategory;

  const SelectCategoryRow({
    super.key,
    required this.onCategorySelected,
    this.selectedCategory,
  });

  Future<List<String>> fetchCategories() async {
    final response = await http.get(
      Uri.parse("https://fakestoreapi.com/products/categories"),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((item) => item.toString()).toList();
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
                  return const ErrorMessage(
                    message: "Error fetching categories",
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const ErrorMessage(message: "No categories found");
                }

                final categories = snapshot.data!;
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: categories.map((label) {
                      final isSelected = label == selectedCategory;

                      return GestureDetector(
                        onTap: () => onCategorySelected(label),
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.0.w),
                          child: Container(
                            width: 108.0.w,
                            height: 40.0.h,
                            decoration: AppDecorations.whiteBox(radius: 8)
                                .copyWith(
                                  color: isSelected
                                      ? Colors.green.withOpacity(0.3)
                                      : Colors.white,
                                ),
                            alignment: Alignment.center,
                            child: Text(
                              label,
                              textAlign: TextAlign.center,
                              style: AppTextStyles.poppinsRegular(
                                fontSize: 12,
                                color: const Color(0xFF2B2B2B),
                              ),
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
