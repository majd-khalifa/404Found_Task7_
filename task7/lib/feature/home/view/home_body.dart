// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task7/feature/cart/model/cart_product_model.dart';
import 'package:task7/feature/cart/provider/cart_provider.dart';
import 'package:task7/feature/home/widgets/sparkle_icon.dart';
import '../../../core/style/textstyle.dart';
import '../../../core/style/app_decorations.dart';
import '../../../core/widgets/app_icon.dart';
import '../model/home_product_model.dart';
import '../../details/view/details_page.dart';

class HomeBody extends StatelessWidget {
  final List<HomeProductModel> products;
  final List<String>? selectedCategories;
  final RangeValues? selectedPriceRange;
  final String? searchQuery;

  const HomeBody({
    super.key,
    required this.products,
    this.selectedCategories,
    this.selectedPriceRange,
    this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    var filteredProducts = products;

    if (selectedCategories != null && selectedCategories!.isNotEmpty) {
      filteredProducts = filteredProducts
          .where((p) => selectedCategories!.contains(p.category))
          .toList();
    }

    if (selectedPriceRange != null) {
      filteredProducts = filteredProducts
          .where(
            (p) =>
                p.price >= selectedPriceRange!.start &&
                p.price <= selectedPriceRange!.end,
          )
          .toList();
    }

    if (searchQuery != null && searchQuery!.isNotEmpty) {
      filteredProducts = filteredProducts
          .where(
            (p) => p.title.toLowerCase().contains(searchQuery!.toLowerCase()),
          )
          .toList();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PopularTShirtRow(products: filteredProducts),
        SizedBox(height: 24.h),
        const NewArrivalsSection(),
      ],
    );
  }
}

class PopularTShirtRow extends StatelessWidget {
  final List<HomeProductModel> products;

  const PopularTShirtRow({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Popular T-shirt",
                style: AppTextStyles.ralewayMedium(
                  fontSize: 16,
                  color: const Color(0xFF2B2B2B),
                  height: 1.5,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12,
                    color: const Color(0xFF34C759),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),

          SizedBox(
            height: 239.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: products.length,
              separatorBuilder: (_, __) => SizedBox(width: 20.w),
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailsPage(productId: product.id),
                      ),
                    );
                  },
                  child: ProductCard(product: product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final HomeProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.42.sw,
      height: 220.h,
      padding: EdgeInsets.all(8.w),
      decoration: AppDecorations.whiteBox(radius: 16),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: Image.network(
                      product.image,
                      width: 0.28.sw,
                      height: 0.28.sw,
                      fit: BoxFit.contain,
                      errorBuilder: (_, __, ___) => const Icon(Icons.error),
                    ),
                  ),
                  const Positioned(
                    top: 6,
                    left: 6,
                    child: AppIcon(
                      asset: 'assets/icons/heart.svg',
                      width: 14,
                      height: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.h),
              Container(
                width: 80.w,
                height: 16.h,
                alignment: Alignment.center,
                child: Text(
                  "BEST SELLER",
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 12,
                    color: const Color(0xFF34C759),
                    letterSpacing: 0.2,
                    height: 1.33,
                  ),
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.ralewaySemiBold(
                  fontSize: 14,
                  color: const Color(0xFF6A6A6A),
                  height: 1.42,
                ),
              ),
              const Spacer(),
              Text(
                "\$${product.price}",
                style: AppTextStyles.poppinsMedium(
                  fontSize: 14,
                  color: const Color(0xFF2B2B2B),
                  height: 1.14,
                ),
              ),
            ],
          ),

          Positioned(
            bottom: -9.h,
            right: -9.w,
            child: AppIcon(
              asset: 'assets/icons/plus.svg',
              width: 34,
              height: 35.5,
              onTap: () {
                final cartItem = CartItemModel.fromHomeProduct(product);
                context.read<CartProvider>().addItem(cartItem);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("${product.title} added to cart")),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NewArrivalsSection extends StatelessWidget {
  const NewArrivalsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "New Arrivals",
              style: AppTextStyles.ralewaySemiBold(
                fontSize: 16,
                color: const Color(0xFF2B2B2B),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See all",
                style: AppTextStyles.poppinsRegular(
                  fontSize: 12,
                  color: const Color(0xFF34C759),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 21.h),

        Container(
          width: 355.w,
          height: 95.h,
          decoration: AppDecorations.whiteBox(radius: 16).copyWith(
            boxShadow: [
              BoxShadow(
                color: const Color(0x33636363),
                blurRadius: 6.r,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: 20.h,
                left: 22.w,
                child: Text(
                  "Summer Sale",
                  style: AppTextStyles.ralewayMedium(
                    fontSize: 12,
                    color: const Color(0xFF3B3B3B),
                  ),
                ),
              ),
              Positioned(
                top: 38.h,
                left: 22.w,
                child: Transform.scale(
                  scaleY: 0.9,
                  child: Text(
                    "15% OFF",
                    style: AppTextStyles.futuraBlack(
                      fontSize: 36,
                      letterSpacing: -2,
                      color: const Color(0xFF674DC5),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -24.24.h,
                right: 19.76.w,
                child: Transform.rotate(
                  angle: -1 * 3.1416 / 180,
                  child: Image.asset(
                    'assets/images/shirt.png',
                    width: 120.w,
                    height: 120.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 12.h,
                right: 131.72.w,
                child: Transform.rotate(
                  angle: -2.91 * 3.1416 / 180,
                  child: Image.asset(
                    'assets/icons/new.png',
                    width: 26.w,
                    height: 26.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Stack(
                clipBehavior: Clip.none,
                children: [
                  SparkleIcon(top: 60, left: 8),
                  SparkleIcon(top: 66, left: 158),
                  SparkleIcon(top: 4, left: 130),
                  SparkleIcon(top: 15, right: 9.52),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
