import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';

class PasswordField extends StatefulWidget {
  final String hinttext;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const PasswordField({
    super.key,
    required this.hinttext,
    required this.controller,
    required this.validator,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  double letterspacing = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 335.w,
      height: 48.h,
      child: Opacity(
        opacity: 0.6,
        child: TextFormField(
          validator: widget.validator,
          controller: widget.controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
            ),
            hintText: widget.hinttext,
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
