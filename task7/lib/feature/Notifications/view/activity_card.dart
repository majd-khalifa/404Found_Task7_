import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Activitycard extends StatelessWidget {
  const Activitycard({
    super.key,
    required this.image,
    required this.subtitle,
    required this.time,
  });

  final String image;
  final String subtitle;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8.r),
          child: Container(
            color: mywhite,
            width: 1.sw,
            height: 105.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(16.r),
                    child: Container(
                      width: 87.w,
                      height: 85.h,
                      color: backgroundcolour,
                      child: Image.asset(
                        image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  27.horizontalSpace,
                  SizedBox(
                    width: 152.w,
                    height: 71.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Thank you for purchasing",
                          style: AppTextStyles.ralewayMedium(
                            color: Colors.black,
                            fontSize: 14.sp,
                            height: 1.h,
                            letterSpacing: 0,
                          ),
                        ),
                        8.verticalSpace,
                        Text(
                          subtitle,
                          style: AppTextStyles.poppinsMedium(
                            color: recoverypasscolor,
                            fontSize: 11.sp,
                            height: (15 / 11).h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 10.w,
          child: Text(
            time,
            softWrap: true,
            maxLines: null,
            overflow: TextOverflow.visible,
            style: AppTextStyles.poppinsMedium(
              color: recoverypasscolor,
              fontSize: 14.sp,
              height: (20 / 14).h,
            ),
          ),
        ),
      ],
    );
  }
}
