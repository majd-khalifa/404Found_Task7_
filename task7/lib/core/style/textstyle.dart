import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  // ========================
  // Raleway
  // ========================
  static TextStyle ralewayRegular({
    double fontSize = 14,
    Color color = Colors.black,
    double height = 1.2,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: "Raleway",
      fontWeight: FontWeight.w400,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle ralewayMedium({
    double fontSize = 16,
    Color color = Colors.black,
    double height = 1.5,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: "Raleway",
      fontWeight: FontWeight.w500,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle ralewaySemiBold({
    double fontSize = 16,
    Color color = Colors.black,
    double height = 1.25,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: "Raleway",
      fontWeight: FontWeight.w600,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle ralewayBold({
    double fontSize = 26,
    Color color = Colors.black,
    double height = 1.0,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: "Raleway",
      fontWeight: FontWeight.w700,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle ralewayBlack({
    double fontSize = 36,
    Color color = Colors.black,
    double height = 1.02,
    double letterSpacing = -0.72,
  }) {
    return TextStyle(
      fontFamily: "Futura",
      fontWeight: FontWeight.w900,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  // ========================
  // Poppins
  // ========================
  static TextStyle poppinsRegular({
    double fontSize = 11,
    Color color = Colors.black,
    double height = 1.8,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w400,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle poppinsMedium({
    double fontSize = 12,
    Color color = Colors.black,
    double height = 1.3,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w500,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle poppinsSemiBold({
    double fontSize = 14,
    Color color = Colors.black,
    double height = 1.4,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w600,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle poppinsBold({
    double fontSize = 24,
    Color color = Colors.black,
    double height = 1.0,
    double letterSpacing = 0,
  }) {
    return TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  // ========================
  // Read More / Read Less
  // ========================
  static TextStyle readMoreStyle({
    double fontSize = 14,
    Color color = Colors.green,
    double height = 1.0,
    double letterSpacing = 0,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(
      fontFamily: "Poppins",
      fontWeight: fontWeight,
      fontSize: fontSize.sp,
      height: height,
      letterSpacing: letterSpacing,
      color: color,
    );
  }

  static TextStyle futuraBlack({
    double fontSize = 36,
    Color color = Colors.black,
    double height = 1.0,
    double letterSpacing = 0,
  }) => TextStyle(
    fontFamily: "Futura",
    fontWeight: FontWeight.w900,
    fontSize: fontSize,
    color: color,
    height: height,
    letterSpacing: letterSpacing,
  );
}
