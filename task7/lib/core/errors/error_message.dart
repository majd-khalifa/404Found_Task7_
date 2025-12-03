import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/textstyle.dart';

/// Widget عام لعرض رسالة خطأ مخصصة
class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: AppTextStyles.ralewayMedium(fontSize: 14.sp, color: Colors.red),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Class فيه رسائل خطأ جاهزة للاستدعاء
class ErrorMessages {
  static ErrorMessage noData() {
    return const ErrorMessage(message: "No data available");
  }

  static ErrorMessage fetchError(String error) {
    return ErrorMessage(message: "Failed to fetch data: $error");
  }

  static ErrorMessage unknownError() {
    return const ErrorMessage(message: "An unexpected error occurred");
  }
}
