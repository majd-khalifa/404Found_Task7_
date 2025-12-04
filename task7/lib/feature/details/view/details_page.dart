import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task7/feature/cart/view/cart_page.dart';
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
        child: FutureBuilder<List<DetailsProductModel>>(
          future: repo.getAllProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 400.h,
                child: const Center(child: CircularProgressIndicator()),
              );
            } else if (snapshot.hasError) {
              return const ErrorMessage(message: "Error loading product list");
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const ErrorMessage(message: "No products found");
            } else {
              final allProducts = snapshot.data!;
              final product = allProducts.firstWhere((p) => p.id == productId);
              final related = allProducts
                  .where(
                    (p) => p.category == product.category && p.id != product.id,
                  )
                  .toList();

              return Column(
                children: [
                  CustomAppBar(
                    title: "T-shirt Shop",
                    rightIcon: SvgPicture.asset('assets/icons/bag.svg'),
                    onRightTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const CartPage()),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  Expanded(
                    child: DetailsBody(
                      product: product,
                      relatedProducts: related,
                    ),
                  ),
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
