import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/widgets/custom_app_bar.dart';
import 'package:task7/feature/Notifications/view/activity_card.dart';
import 'package:task7/feature/Notifications/view/product_card.dart';
import 'package:task7/feature/Notifications/view/section_header.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          color: backgroundcolour,
          child: ListView(
            children: [
              // ✅ نخلي الـ AppBar خارج الـ Padding
              CustomAppBar(
                title: 'Notifications',
                rightIcon: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset("assets/icons/trush.svg"),
                ),
              ),

              // ✅ باقي العناصر داخل الـ Padding
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // ✅ يخلي كل العناصر تبدأ من اليسار
                  children: [
                    16.verticalSpace,

                    // Recent على اليسار
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Sectionheader(title: 'Recent'),
                    ),

                    16.verticalSpace,
                    Activitycard(
                      image: 'assets/images/shirt.png',
                      subtitle: 'Your order will be shipped\nin 2-4 days',
                      time: '7 min ago',
                    ),
                    16.verticalSpace,
                    Productcard(
                      image: 'assets/images/shirt.png',
                      time: '40 min ago',
                      oldPrice: '\$364.95',
                      newPrice: '\$260.00',
                    ),

                    40.verticalSpace,

                    // Yesterday على اليسار
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Sectionheader(title: 'Yesterday'),
                    ),

                    20.verticalSpace,
                    Productcard(
                      image: 'assets/images/shirt.png',
                      time: "40 min ago",
                      oldPrice: '\$364.95',
                      newPrice: '\$260.00',
                    ),
                    16.verticalSpace,
                    Productcard(
                      image: 'assets/images/shirt.png',
                      time: "40 min ago",
                      oldPrice: '\$364.95',
                      newPrice: '\$260.00',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
