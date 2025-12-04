import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/feature/home/view/home_page.dart';
import '../../../core/style/textstyle.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final Color? backgroundColor;
  final Color? backBackgroundColor;
  final VoidCallback? onBack;
  final Widget? rightIcon;
  final bool showBack;
  final String? backIconPath;
  final String? rightText;
  final VoidCallback? onRightTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.titleColor,
    this.backgroundColor,
    this.backBackgroundColor,
    this.onBack,
    this.rightIcon,
    this.showBack = true,
    this.backIconPath,
    this.rightText,
    this.onRightTap,
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
                      onLongPress: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => const HomePage()),
                          (route) => false,
                        );
                      },
                      child: Container(
                        width: 44.w,
                        height: 44.w,
                        decoration: BoxDecoration(
                          color: backBackgroundColor ?? Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            backIconPath ?? 'assets/icons/back.svg',
                            width: 44.w,
                            height: 44.h,
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

              rightText != null
                  ? GestureDetector(
                      onTap: onRightTap,
                      child: Text(
                        rightText!,
                        style: AppTextStyles.ralewaySemiBold(
                          fontSize: 15.sp,
                          color: Colors.green,
                        ),
                      ),
                    )
                  : GestureDetector(
                      onTap: onRightTap,
                      child: rightIcon ?? const SizedBox(width: 44, height: 44),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
