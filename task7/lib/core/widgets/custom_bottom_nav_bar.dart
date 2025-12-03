// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../feature/home/view/home_page.dart';
import '../../feature/favorites/view/favorites_page.dart';
import '../../feature/notifications/view/notifications_page.dart';
import '../../feature/profile/view/profile_page.dart';
import '../../feature/cart/view/cart_page.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 106.h),
          painter: _NavBarPainter(),
        ),

        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 106.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/home.svg',
                    width: 22.w,
                    height: 24.h,
                    color: const Color(0xFF34C759),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FavoritesPage()),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/heart.svg',
                    width: 24.w,
                    height: 24.h,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(width: 88.w),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const NotificationsPage(),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/notification.svg',
                    width: 24.w,
                    height: 24.h,
                    color: Colors.grey,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ProfilePage(userId: 1),
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    'assets/icons/profile.svg',
                    width: 24.w,
                    height: 24.h,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 40.h,
          left: (MediaQuery.of(context).size.width / 2) - (112.w / 2),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartPage()),
              );
            },
            child: Container(
              width: 112.w,
              height: 112.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x5B9EE199),
                    offset: const Offset(0, 0),
                    blurRadius: 24,
                    spreadRadius: -8,
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/icons/bag_bar.svg',
                width: 112.w,
                height: 112.h,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double fabRadius = 40.r;
    final double notchDepth = fabRadius - 20.r;
    final double centerX = size.width / 2;

    final Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Path path = Path();

    path.moveTo(0, -25.h);
    path.quadraticBezierTo(
      size.width * 0.15,
      6.h,
      centerX - fabRadius * 1.4,
      0,
    );

    path.quadraticBezierTo(
      centerX - fabRadius * 0.99,
      0,
      centerX - fabRadius * 0.98,
      notchDepth,
    );
    path.arcToPoint(
      Offset(centerX + fabRadius, notchDepth * 0.8),
      radius: Radius.elliptical(1.4, 1.1),
      clockwise: false,
    );
    path.quadraticBezierTo(
      centerX + fabRadius * 0.98,
      0,
      centerX + fabRadius * 1.4,
      0,
    );

    path.quadraticBezierTo(size.width * 0.85, 6.h, size.width, -25.h);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    canvas.drawShadow(path, Colors.black26, 8.0, true);

    canvas.drawPath(path, paint);

    final Paint stroke = Paint()
      ..color = const Color(0xFF83AAD1).withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2.w;
    canvas.drawPath(path, stroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
