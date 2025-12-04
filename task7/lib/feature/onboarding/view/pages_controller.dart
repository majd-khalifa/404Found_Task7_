import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';
import 'package:task7/core/widgets/my_button.dart';
import 'package:task7/feature/onboarding/view/pages/onboarding1.dart';
import 'package:task7/feature/onboarding/view/pages/onboarding2.dart';
import 'package:task7/feature/onboarding/view/pages/onboarding3.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Widget> pages = const [
    Onboarding1(),
    Onboarding2(),
    Onboarding3(),
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.animateToPage(
        currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/signin');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => currentPage = index);
              },
              children: pages,
            ),
          ),
          Positioned(
            bottom: 241.h,
            right: 163.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                bool isactive = currentPage == index;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isactive ? 42.w : 28.w,
                  height: 6.h,
                  decoration: BoxDecoration(
                    color: isactive ? mywhite : mygreen,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                );
              }),
            ),
          ),
          Positioned(
            bottom: 36.h,
            right: 20.w,
            left: 20.w,
            child: MyButton(
              widget: Text(
                currentPage == 0 ? "Get Started" : "Next",
                style: AppTextStyles.ralewaySemiBold(
                  color: myblack,
                  fontSize: 14.sp,
                  height: 1.h,
                ),
              ),
              color: Color(0xffECECEC),
              onPressed: () => nextPage(),
            ),
          ),
      
          // Positioned(
          //   bottom: 36.h,
          //   left: 20.w,
          //   child: Mybottom(
          //     onPressed: () => nextPage(),
          //     widget: Text(
          //       currentPage == pages.length - 1 ? "ابدأ" : "التالي",
          //     ),
          //     color: mygray,
          //   ),
          // ),
        ],
      ),
    );
  }
}
