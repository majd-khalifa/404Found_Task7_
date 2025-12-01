import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../data/details_repository.dart';
import '../model/details_product_model.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/errors/error_message.dart';
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
                height: 400.h,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              return const ErrorMessage(message: "Error loading product");
            } else if (!snapshot.hasData) {
              return const ErrorMessage(message: "No product details found");
            } else {
              final product = snapshot.data!;
              return Column(
                children: [
                  const CustomAppBar(title: "T-shirt Shop"),
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
