// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';
import '../model/cart_product_model.dart';

class CartItemSlidableCard extends StatelessWidget {
  final CartItemModel item;
  final VoidCallback onDelete;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final bool showHeader; // ✅ لتحديد إذا بدنا نعرض العنوان
  final int itemCount; // ✅ العدد الكلي

  const CartItemSlidableCard({
    super.key,
    required this.item,
    required this.onDelete,
    required this.onIncrement,
    required this.onDecrement,
    this.showHeader = false,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ✅ العنوان "X Items" يظهر فقط إذا showHeader = true
        if (showHeader)
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 24.h),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "$itemCount Item",
                style: AppTextStyles.poppinsMedium(
                  fontSize: 16.sp,
                  color: const Color(0xFF1A2530),
                ),
              ),
            ),
          ),

        Slidable(
          key: ValueKey(item.id),

          // ✅ السحب لليمين: زيادة/إنقاص الكمية
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.18,
            children: [
              CustomSlidableAction(
                onPressed: (_) {},
                backgroundColor: Colors.green,
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 104.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ✅ زر زائد بمساحة ضغط أكبر
                      InkWell(
                        onTap: onIncrement,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            'assets/icons/plus_cart.svg',
                            width: 22,
                            height: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),

                      Text(
                        "${item.quantity}",
                        style: AppTextStyles.ralewayRegular(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),

                      // ✅ زر ناقص بمساحة ضغط أكبر
                      InkWell(
                        onTap: onDecrement,
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          child: SvgPicture.asset(
                            'assets/icons/minus.svg',
                            width: 22,
                            height: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ✅ السحب لليسار: حذف
          endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.18,
            children: [
              CustomSlidableAction(
                onPressed: (_) => onDelete(),
                backgroundColor: const Color(0xffFF1900),
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 104.h,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/delete.svg',
                      width: 22,
                      height: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ✅ الكارت نفسه
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            child: Container(
              height: 104.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.white,
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
                  SizedBox(width: 10.w),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Container(
                      width: 87.w,
                      height: 85.h,
                      color: const Color(0xFFF0F0F0),
                      child: Image.network(item.imageUrl, fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12.h),
                        Text(
                          item.title,
                          style: AppTextStyles.ralewayMedium(
                            fontSize: 13.sp,
                            color: const Color(0xFF1A2530),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 6.h),
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
                  SizedBox(width: 12.w),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
