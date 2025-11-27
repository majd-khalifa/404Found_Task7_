import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/details_product_model.dart';

class CustomBottomBar extends StatelessWidget {
  final DetailsProductModel product;

  const CustomBottomBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h, // ✅ responsive height
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/icons/Favorite.png', width: 48.w, height: 48.w),
          SizedBox(width: 32.w),
          Image.asset(
            'assets/icons/add_to_cart.png',
            width: 220.w,
            height: 48.h,
          ),
        ],
      ),
    );
  }
}
