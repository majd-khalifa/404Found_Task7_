import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/style/textstyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final VoidCallback? onBack;
  final Widget? rightIcon;
  final bool showBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleColor,
    this.backgroundColor,
    this.onBack,
    this.rightIcon,
    this.showBack = true,
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
                      child: SvgPicture.asset(
                        'assets/icons/back.svg',
                        width: 44.w,
                        height: 44.w,
                      ),
                    )
                  : const SizedBox(width: 44, height: 44),

              Text(
                title,
                style: AppTextStyles.ralewaySemiBold(
                  fontSize: 16.sp,
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
