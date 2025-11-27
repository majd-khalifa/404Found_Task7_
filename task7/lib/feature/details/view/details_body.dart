import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import '../model/details_product_model.dart';

class DetailsBody extends StatelessWidget {
  final DetailsProductModel product;

  const DetailsBody({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),

          Text(
            product.title,
            style: AppTextStyles.ralewaySemiBold(
              fontSize: 18.sp,
              color: const Color(0xFF2B2B2B),
            ),
          ),

          SizedBox(height: 8.h),

          Text(
            product.category,
            style: AppTextStyles.ralewayRegular(
              fontSize: 14.sp,
              color: const Color(0xFF707B81),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 12.h),

          Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: AppTextStyles.poppinsSemiBold(
              fontSize: 18.sp,
              color: const Color(0xFF2B2B2B),
            ),
          ),

          SizedBox(height: 16.h),

          Center(
            child: Image.network(
              product.image,
              width: 240.w,
              height: 220.h,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 12.h),

          Center(
            child: Image.asset(
              'assets/icons/Slider.png',
              width: 320.w,
              height: 60.h,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 24.h),

          Text(
            product.description,
            style: AppTextStyles.poppinsRegular(
              fontSize: 14.sp,
              color: const Color(0xFF707B81),
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 12.h),

          Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Read More",
              style: AppTextStyles.poppinsRegular(
                fontSize: 14.sp,
                color: const Color(0xFF34C759),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
