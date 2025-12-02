import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/style/textstyle.dart';
import '../provider/cart_provider.dart';

class CheckoutBar extends StatelessWidget {
  const CheckoutBar({super.key});

  @override
  Widget build(BuildContext context) {
    final subtotal = context.watch<CartProvider>().totalPrice;
    const delivery = 60.20;
    final totalPrice = subtotal + delivery;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      child: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 56.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Subtotal",
                        style: AppTextStyles.ralewayMedium(
                          fontSize: 16.sp,
                          color: const Color(0xFF707B81),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$${subtotal.toStringAsFixed(2)}",
                        style: AppTextStyles.poppinsMedium(
                          fontSize: 16.sp,
                          color: const Color(0xFF1A2530),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Delivery",
                        style: AppTextStyles.ralewayMedium(
                          fontSize: 16.sp,
                          color: const Color(0xFF707B81),
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "\$${delivery.toStringAsFixed(2)}",
                        style: AppTextStyles.poppinsMedium(
                          fontSize: 16.sp,
                          color: const Color(0xFF1A2530),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: Divider(thickness: 3, color: const Color(0xFFEDEDED)),
            ),
            Row(
              children: [
                Text(
                  "Total Cost",
                  style: AppTextStyles.ralewayMedium(
                    fontSize: 16.sp,
                    color: const Color(0xFF2B2B2B),
                  ),
                ),
                const Spacer(),
                Text(
                  "\$${totalPrice.toStringAsFixed(2)}",
                  style: AppTextStyles.poppinsMedium(
                    fontSize: 16.sp,
                    color: const Color(0xFF34C759),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50.h,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF34C759),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: const Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
