import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[100],
      fontFamily: 'Raleway',

      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFF2B2B2B),
        secondary: const Color(0xFF4CAF50),
      ),

      textTheme: TextTheme(
        bodyMedium: TextStyle(fontSize: 14.sp, color: const Color(0xFF2B2B2B)),
        bodyLarge: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: const Color(0xFF2B2B2B),
        ),
        titleLarge: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2B2B2B),
        ),
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: const Color(0xFF2B2B2B),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF2B2B2B)),
      ),

      buttonTheme: ButtonThemeData(
        buttonColor: const Color(0xFF4CAF50),
        textTheme: ButtonTextTheme.primary,
      ),
    );
  }
}
