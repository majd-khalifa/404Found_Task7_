import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Productcard extends StatelessWidget {
  const Productcard({
    super.key,
    required this.image,
    required this.time,
    required this.oldPrice,
    required this.newPrice,
  });

  final String image;
  final String time;
  final String oldPrice;
  final String newPrice;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: 1.sw,
          height: 105.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Container(
                    width: 87.w,
                    height: 85.h,
                    color: mywhite,
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
                        "We Have New Products With Offers",
                        style: AppTextStyles.ralewayMedium(
                          color: Colors.black,
                          height: 1,
                          fontSize: 14.sp,
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        children: [
                          Text(
                            oldPrice,
                            style: AppTextStyles.poppinsMedium(
                              color: Colors.black,
                              fontSize: 14.sp,
                              height: (20 / 14).h,
                            ),
                          ),
                          20.horizontalSpace,
                          Text(
                            newPrice,
                            style: AppTextStyles.poppinsMedium(
                              color: recoverypasscolor,
                              fontSize: 14.sp,
                              height: (20 / 14).h,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10.h,
          right: 10.w,
          child: Text(
            time,
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
