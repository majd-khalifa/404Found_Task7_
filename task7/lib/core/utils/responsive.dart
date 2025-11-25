import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 // استبدل بالمسار الصحيح

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
         // home: const Homepage(),
          debugShowCheckedModeBanner: false,
        
        );
      },
    );
  }
}
