import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/feature/profile/view/profile_page.dart';
import 'package:task7/feature/search/view/search_page.dart';
import 'package:task7/feature/side_menu/view/side_menu_page.dart';
import 'core/style/apptheme/apptheme.dart';
import 'feature/home/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Task 7',
          theme: AppTheme.lightTheme,
          home: child,
        );
      },

     // child: const HomePage(),
    child: const ProfilePage(userId: 2,),
   // 
    //child: const SidebarPage(userId: 1),

    );
  }
}
