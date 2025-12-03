import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/textstyle.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'search_header.dart';
import 'search_body.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        title: "Search",
        rightText: "Cancel",
        showBack: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchHeader(controller: searchController),
            SizedBox(height: 20.h),
            Text(
              "Shirt",
              style: AppTextStyles.ralewayMedium(
                fontSize: 18.sp,
                color: Colors.black,
                height: 1.22.h,
              ),
            ),
            SizedBox(height: 16.h),
            Expanded(child: SearchBody()),
          ],
        ),
      ),
    );
  }
}
