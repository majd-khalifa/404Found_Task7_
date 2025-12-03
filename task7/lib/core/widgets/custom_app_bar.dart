import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? backBackgroundColor;
  final VoidCallback? onBack;
  final Widget? rightIcon;
  final bool showBack;
  final String? backIconPath; // ✅ خيار جديد لتغيير أيقونة الرجوع

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleColor,
    this.backgroundColor,
    this.backBackgroundColor,
    this.onBack,
    this.rightIcon,
    this.showBack = true,
    this.backIconPath, // ✅
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.transparent,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              showBack
                  ? GestureDetector(
                      onTap: onBack ?? () => Navigator.pop(context),
                      child: Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: BoxDecoration(
                          color: backBackgroundColor ?? Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: backIconPath != null
                              ? SvgPicture.asset(
                                  backIconPath!,
                                  width: 44.w,
                                  height: 44.w,
                                )
                              : SvgPicture.asset(
                                  'assets/icons/back.svg', // الافتراضية
                                  width: 44.w,
                                  height: 44.w,
                                ),
                        ),
                      ),
                    )
                  : const SizedBox(width: 44, height: 44),

              Text(
                title,
                style: AppTextStyles.ralewaySemiBold(
                  fontSize: 20.sp,
                  color: titleColor ?? const Color(0xFF2B2B2B),
                ),
                overflow: TextOverflow.ellipsis,
              ),

              rightIcon ?? const SizedBox(width: 44, height: 44),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
