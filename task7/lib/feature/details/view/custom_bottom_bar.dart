// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../cart/model/cart_product_model.dart';
import '../../cart/provider/cart_provider.dart';
import '../model/details_product_model.dart';
import '../../../core/style/textstyle.dart';

class CustomBottomBar extends StatelessWidget {
  final DetailsProductModel product;

  const CustomBottomBar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ✅ زر المفضلة
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Added to favorites")),
              );
            },
            child: Image.asset(
              'assets/icons/Favorite.png',
              width: 48.w,
              height: 48.w,
            ),
          ),

          SizedBox(width: 32.w),

          // ✅ زر Add to Cart مطابق للصورة
          Expanded(
            child: GestureDetector(
              onTap: () {
                final cartItem = CartItemModel(
                  id: product.id,
                  title: product.title,
                  price: product.price,
                  imageUrl: product.image,
                  quantity: 1,
                );
                context.read<CartProvider>().addItem(cartItem);

                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(const SnackBar(content: Text("Added to cart")));
              },
              child: Container(
                height: 50.h,
                width: 208.w,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/cart_in_profile_page.svg',
                      width: 24.w,
                      height: 24.h,
                      color: Colors.white,
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      "Add To Cart",
                      style: AppTextStyles.ralewaySemiBold(
                        fontSize: 14.sp,
                        color: Colors.white,
                        height: 22 / 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
