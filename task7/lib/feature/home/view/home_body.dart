// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import '../model/home_product_model.dart';
import '../../details/view/details_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeBody extends StatelessWidget {
  final List<HomeProductModel> products;

  const HomeBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PopularTShirtRow(products: products),
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
                style: AppTextStyles.ralewaySemiBold(
                  fontSize: 16,
                  color: const Color(0xFF2B2B2B),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: Text(
                  "See all",
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 14,
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
              separatorBuilder: (_, __) => SizedBox(width: 16.w),
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
      clipBehavior: Clip.none,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6.r,
            offset: const Offset(0, 4),
          ),
        ],
      ),
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
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                    top: 6.h,
                    left: 6.w,
                    child: SvgPicture.asset(
                      'assets/icons/heart.svg',
                      width: 14.w,
                      height: 14.h,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 8.h),

              Container(
                width: 80.w,
                height: 16.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  "BEST SELLER",
                  style: AppTextStyles.ralewayBold(
                    fontSize: 12,
                    color: const Color(0xFF34C759),
                    letterSpacing: 0.2,
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              Text(
                product.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.ralewaySemiBold(
                  fontSize: 14,
                  color: const Color(0xFF6A6A6A),
                ),
              ),

              const Spacer(),

              Text(
                "\$${product.price}",
                style: AppTextStyles.poppinsMedium(
                  fontSize: 14,
                  color: const Color(0xFF2B2B2B),
                ),
              ),
            ],
          ),

          Positioned(
            bottom: -9.h,
            right: -9.w,
            child: Container(
              width: 34.w,
              height: 35.5.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: SvgPicture.asset(
                  'assets/icons/plus.svg',
                  width: 34.w,
                  height: 35.5.h,
                ),
              ),
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
        /// العنوان + زر "See all"
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
                style: AppTextStyles.poppinsMedium(
                  fontSize: 14,
                  color: const Color(0xFF34C759),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),

        /// نفس الكونتينر القديم لكن مع قيم ScreenUtil
        Container(
          width: 0.94.sw,
          height: 120.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
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
                top: 24.h,
                left: 28.w,
                child: Text(
                  "Summer Sale",
                  style: AppTextStyles.ralewayMedium(
                    fontSize: 14,
                    color: const Color(0xFF3B3B3B),
                  ),
                ),
              ),
              Positioned(
                top: 48.h,
                left: 28.w,
                child: Transform.scale(
                  scaleY: 1.4,
                  child: Text(
                    "15% OFF",
                    style: AppTextStyles.futuraBlack(
                      fontSize: 30,
                      letterSpacing: -1.92,
                      color: const Color(0xFF674DC5),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: -30.h,
                left: 160.w,
                child: Transform.rotate(
                  angle: -1 * 3.1416 / 180,
                  child: Image.asset(
                    'assets/images/shirt.png',
                    width: 140.w,
                    height: 140.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 20.h,
                left: 150.w,
                child: Transform.rotate(
                  angle: -2.91 * 3.1416 / 180,
                  child: Image.asset(
                    'assets/icons/new.png',
                    width: 30.w,
                    height: 30.w,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Positioned(
                top: 90.h,
                left: 12.w,
                child: Image.asset(
                  'assets/icons/sparkle.png',
                  width: 18.w,
                  height: 18.w,
                  color: const Color(0xFF000042),
                ),
              ),
              Positioned(
                top: 98.h,
                left: 170.w,
                child: Image.asset(
                  'assets/icons/sparkle.png',
                  width: 18.w,
                  height: 18.w,
                  color: const Color(0xFF000042),
                ),
              ),
              Positioned(
                top: 10.h,
                left: 140.w,
                child: Image.asset(
                  'assets/icons/sparkle.png',
                  width: 18.w,
                  height: 18.w,
                  color: const Color(0xFF000042),
                ),
              ),
              Positioned(
                top: 20.h,
                left: 340.w,
                child: Image.asset(
                  'assets/icons/sparkle.png',
                  width: 18.w,
                  height: 18.w,
                  color: const Color(0xFF000042),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
