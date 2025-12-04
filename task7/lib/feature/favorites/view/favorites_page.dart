import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/widgets/custom_app_bar.dart';
import 'package:task7/core/widgets/custom_bottom_nav_bar.dart';
import 'package:task7/feature/favorites/widget/favorites_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundcolour,
      bottomNavigationBar: const CustomBottomNavBar(activePage: 1),
      body: Column(
        children: [
          CustomAppBar(
            title: "Favourite",
            rightIcon: SvgPicture.asset('assets/icons/favotire.svg'),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.79,
                ),
                children: [
                  Favoritescard(
                    image: 'assets/images/shirtf.png',
                    price: '58.7',
                    firstcolor: myred,
                    secondcolor: const Color(0xff0B2F8B),
                  ),
                  Favoritescard(
                    image: 'assets/images/P_shirt.png',
                    price: '37.8',
                    firstcolor: const Color(0xff1F3267),
                    secondcolor: myred,
                  ),
                  Favoritescard(
                    image: 'assets/images/prigramming_shirt.png',
                    price: '47.7',
                    firstcolor: const Color(0xff2256B9),
                    secondcolor: const Color(0xffA9CFEB),
                  ),
                  Favoritescard(
                    image: 'assets/images/programmershirt.png',
                    price: '57.6',
                    firstcolor: const Color(0xff7DDBDA),
                    secondcolor: const Color(0xff606ACB),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
