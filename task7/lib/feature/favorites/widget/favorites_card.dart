import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Favoritescard extends StatelessWidget {
  final String image;
  final String price;
  final Color firstcolor;
  final Color secondcolor;

  const Favoritescard({
    super.key,
    required this.image,
    required this.price,
    required this.firstcolor,
    required this.secondcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 33.w, right: 33.w, top: 20.h),
                child: SizedBox(
                  width: 93.w,
                  height: 95.h,
                  child: Image.asset(image),
                ),
              ),
              2.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BEST SELLER",
                      style: AppTextStyles.poppinsMedium(
                        color: mygreen,
                        fontSize: 12.sp,
                        height: (16.h / 12.sp),
                      ),
                    ),
                    4.verticalSpace,
                    Text(
                      "Programmer T-shirt",
                      style: AppTextStyles.ralewayMedium(
                        color: myblack,
                        fontSize: 13.sp,
                        height: (20.h / 13.sp),
                      ),
                    ),
                    12.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "\$$price",
                          style: AppTextStyles.poppinsMedium(height: 1.25.h),
                        ),
                        45.horizontalSpace,
                        Container(
                          width: 16.w,
                          height: 16.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: firstcolor,
                            border: Border.all(
                              width: 2.w,
                              color: backgroundcolour,
                            ),
                          ),
                        ),
                        10.horizontalSpace,
                        Container(
                          width: 16.w,
                          height: 16.h,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: secondcolor,
                            border: Border.all(
                              width: 2.w,
                              color: backgroundcolour,
                            ),
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
        Positioned(
          top: 18.h,
          left: 12.w,
          child: SvgPicture.asset("assets/icons/boarded_favorite.svg"),
        ),
      ],
    );
  }
}
