import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/details_repository.dart';
import '../model/details_product_model.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'custom_bottom_bar.dart';
import 'details_body.dart';

class DetailsPage extends StatelessWidget {
  final int productId;

  const DetailsPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final repo = DetailsRepository();

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<DetailsProductModel>(
          future: repo.getProductDetails(productId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 400.h, // ✅ استخدام ScreenUtil للارتفاع
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error: ${snapshot.error}",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ), // ✅ استخدام ScreenUtil للخط
                ),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text(
                  "No product details found",
                  style: TextStyle(
                    fontSize: 14.sp,
                  ), // ✅ استخدام ScreenUtil للخط
                ),
              );
            } else {
              final product = snapshot.data!;
              return Column(
                children: [
                  CustomAppBar(title: "T-shirt Shop"),
                  SizedBox(height: 16.h),
                  Expanded(child: DetailsBody(product: product)),
                  SizedBox(height: 12.h),
                  CustomBottomBar(product: product),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
