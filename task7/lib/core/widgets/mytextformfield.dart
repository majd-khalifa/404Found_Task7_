import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class Mytextformfield extends StatelessWidget {
  final String hinttext;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final double letterspacing;

  const Mytextformfield({
    super.key,
    required this.hinttext,
    required this.letterspacing,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 48.h,
      child: Opacity(
        opacity: 0.6,
        child: TextFormField(
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: hinttext,
            filled: true,
            fillColor: backgroundcolour,
            border: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none, width: 0),
              borderRadius: BorderRadius.circular(14.r),
            ),
          ),
          style: AppTextStyles.poppinsMedium(
            fontSize: 14.sp,
            letterSpacing: letterspacing,
            height: (16 / 14).h,
            color: hintcolor,
          ),
        ),
      ),
    );
  }
}
