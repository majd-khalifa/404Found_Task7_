import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import '../model/details_product_model.dart';
import 'details_page.dart';

class DetailsBody extends StatelessWidget {
  final DetailsProductModel product;
  final List<DetailsProductModel> relatedProducts;

  const DetailsBody({
    super.key,
    required this.product,
    required this.relatedProducts,
  });

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
            style: AppTextStyles.ralewayBold(
              fontSize: 18.sp,
              color: const Color(0xFF2B2B2B),
            ),
          ),

          SizedBox(height: 8.h),

          // ✅ الفئة
          Text(
            product.category,
            style: AppTextStyles.ralewayMedium(
              fontSize: 14.sp,
              color: const Color(0xFF707B81),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          SizedBox(height: 12.h),

          // ✅ السعر
          Text(
            "\$${product.price.toStringAsFixed(2)}",
            style: AppTextStyles.poppinsSemiBold(
              fontSize: 18.sp,
              color: const Color(0xFF2B2B2B),
            ),
          ),

          Center(
            child: Image.network(
              product.image,
              width: 217.w,
              height: 220.h,
              fit: BoxFit.contain,
            ),
          ),

          Center(
            child: Image.asset(
              'assets/icons/Slider.png',
              width: 352.w,
              height: 77.h,
              fit: BoxFit.contain,
            ),
          ),

          SizedBox(height: 22.h),

          SizedBox(
            height: 72.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: relatedProducts.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                final item = relatedProducts[index];
                return GestureDetector(
                  onTap: () {
                    // ✅ الانتقال لصفحة تفاصيل جديدة
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(productId: item.id),
                      ),
                    );
                  },
                  child: Container(
                    width: 56.w,
                    height: 56.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Center(
                      child: Image.network(
                        item.image,
                        width: 40.w,
                        height: 40.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 24.h),

          Text(
            product.description,
            style: AppTextStyles.poppinsRegular(
              fontSize: 14.sp,
              height: 20 / 11,
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
                height: 21 / 14,
                color: const Color(0xFF34C759),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
