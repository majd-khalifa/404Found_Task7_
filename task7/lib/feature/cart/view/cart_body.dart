import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import '../model/cart_product_model.dart';
import '../widgets/cart_card.dart';

class CartBody extends StatelessWidget {
  final List<CartItemModel> cartItems;
  final VoidCallback onCheckout;
  final Function(CartItemModel) onDelete;
  final Function(CartItemModel) onIncrement;
  final Function(CartItemModel) onDecrement;

  const CartBody({
    super.key,
    required this.cartItems,
    required this.onCheckout,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  double get subtotal =>
      cartItems.fold(0, (sum, item) => sum + item.price * item.quantity);

  @override
  Widget build(BuildContext context) {
    final deliveryFee = 60.20;
    final total = subtotal + deliveryFee;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24.h),
          Text(
            "${cartItems.length} Items",
            style: AppTextStyles.poppinsMedium(
              fontSize: 16.sp,
              color: const Color(0xFF1A2530),
            ),
          ),
          SizedBox(height: 16.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return CartCard(
                item: item,
                onDelete: () => onDelete(item),
                onIncrement: () => onIncrement(item),
                onDecrement: () => onDecrement(item),
              );
            },
          ),
          SizedBox(height: 24.h),
          Divider(color: Colors.grey.shade300),
          SizedBox(height: 16.h),
          _buildPriceRow("Subtotal", subtotal),
          SizedBox(height: 8.h),
          _buildPriceRow("Delivery", deliveryFee),
          SizedBox(height: 8.h),
          _buildPriceRow("Total Cost", total, isBold: true),
          SizedBox(height: 24.h),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(vertical: 14.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                "Checkout",
                style: AppTextStyles.poppinsMedium(
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 24.h),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, double value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold
              ? AppTextStyles.poppinsMedium(fontSize: 14.sp)
              : AppTextStyles.ralewayRegular(fontSize: 14.sp),
        ),
        Text(
          "\$${value.toStringAsFixed(2)}",
          style: isBold
              ? AppTextStyles.poppinsMedium(fontSize: 14.sp)
              : AppTextStyles.ralewayRegular(fontSize: 14.sp),
        ),
      ],
    );
  }
}
