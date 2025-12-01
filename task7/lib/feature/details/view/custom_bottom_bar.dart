import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../cart/model/cart_product_model.dart';
import '../../cart/provider/cart_provider.dart';
import '../model/details_product_model.dart';

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

          GestureDetector(
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
            child: Image.asset(
              'assets/icons/add_to_cart.png',
              width: 220.w,
              height: 48.h,
            ),
          ),
        ],
      ),
    );
  }
}
