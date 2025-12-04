import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task7/core/style/colors/color.dart';

import 'package:task7/feature/home/view/home_page.dart';
import 'package:task7/feature/onboarding/view/pages_controller.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Future<void> check() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");
    await Future.delayed(Duration(seconds: 4));
    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    check();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff282828),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: mywhite),
            20.verticalSpace,
            CircleAvatar(
              radius: 100,
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(60.r),
                child: Image.asset("assets/images/our_team.png"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
