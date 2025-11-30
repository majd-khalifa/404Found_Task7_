import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../../../core/style/textstyle.dart';
import '../model/cart_product_model.dart';

class CartCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(item.id),
      startActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 58.w / 375.w,
        children: [
          Container(
            width: 58.w,
            height: 104.h,
            margin: EdgeInsets.only(left: 20.w),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 14.h,
                  left: 22.w,
                  child: GestureDetector(
                    onTap: onIncrement,
                    child: Icon(Icons.add, size: 14.sp, color: Colors.white),
                  ),
                ),
                Positioned(
                  top: 51.h,
                  left: 26.w,
                  child: Text(
                    "${item.quantity}",
                    style: AppTextStyles.ralewayRegular(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 89.5.h,
                  left: 22.w,
                  child: GestureDetector(
                    onTap: onDecrement,
                    child: Container(
                      width: 14.w,
                      height: 1.h,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 58.w / 375.w,
        children: [
          Container(
            width: 58.w,
            height: 104.h,
            margin: EdgeInsets.only(right: 20.w),
            decoration: BoxDecoration(
              color: const Color(0xFFFF1900),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Center(
              child: Icon(Icons.delete, size: 20.sp, color: Colors.white),
            ),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Container(
          height: 104.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0x0A000000),
                blurRadius: 48.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            children: [
              SizedBox(width: 30.w),
              Image.network(item.imageUrl, width: 87.w, height: 85.h),
              SizedBox(width: 30.w),
              SizedBox(
                width: 119.w,
                height: 46.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    Text(
                      item.title,
                      maxLines: 1,
                      style: AppTextStyles.ralewayMedium(
                        fontSize: 13.sp,
                        color: const Color(0xFF1A2530),
                      ),
                    ),
                    SizedBox(height: 0.h),
                    Text(
                      "\$${item.price.toStringAsFixed(2)}",
                      style: AppTextStyles.poppinsMedium(
                        fontSize: 14.sp,
                        color: const Color(0xFF1A2530),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
