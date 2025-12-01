import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../feature/home/view/home_page.dart'; // ✅ استبدل بالمسار الصحيح

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // ✅ حجم التصميم الأساسي
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'task7',
          debugShowCheckedModeBanner: false,
          home: child, // ✅ استخدم child هنا
        );
      },
      child: const HomePage(), // ✅ الصفحة الرئيسية بعد التهيئة
    );
  }
}
