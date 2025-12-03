// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task7/core/style/textstyle.dart';
import 'package:task7/core/widgets/app_icon.dart';
import '../model/user_model.dart';

class SidebarPage extends StatefulWidget {
  final int userId;
  const SidebarPage({super.key, required this.userId});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  User? user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      final response = await Dio().get(
        'https://dummyjson.com/users/${widget.userId}',
      );
      if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
        setState(() {
          user = User.fromJson(response.data as Map<String, dynamic>);
          _isLoading = false;
        });
      } else {
        setState(() => _isLoading = false);
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('userId');
    await prefs.remove('username');
    Navigator.pushReplacementNamed(context, '/signin');
  }

  @override
  Widget build(BuildContext context) {
    // ✅ قائمة العناصر
    final menuItems = [
      {
        "icon": "assets/icons/profile1.svg",
        "label": "Profile",
        "onTap": () => Navigator.pushNamed(context, '/profile'),
      },
      {
        "icon": "assets/icons/cart_in_profile_page.svg",
        "label": "My Cart",
        "onTap": () => Navigator.pushNamed(context, '/cart'),
      },
      {
        "icon": "assets/icons/heart.svg",
        "label": "Favorite",
        "onTap": () => Navigator.pushNamed(context, '/favorites'),
      },
      {
        "icon": "assets/icons/orders.svg",
        "label": "Orders",
        "onTap": () {}, // dummy
      },
      {
        "icon": "assets/icons/notification1.svg",
        "label": "Notifications",
        "onTap": () => Navigator.pushNamed(context, '/notifications'),
      },
      {
        "icon": "assets/icons/setting.svg",
        "label": "Settings",
        "onTap": () {}, // dummy
      },
    ];

    return SafeArea(
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40.r,
                    backgroundColor: Colors.grey[300],
                    child: ClipOval(
                      child: Image.network(
                        user?.image ??
                            'https://ui-avatars.com/api/?name=${user?.getFullName()}',
                        width: 80.r,
                        height: 80.r,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    user?.getFullName() ?? "Guest",
                    style: AppTextStyles.ralewayMedium(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30.h),

                  // ✅ القائمة الجانبية باستخدام القائمة
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: menuItems
                            .map(
                              (item) => _buildMenuItem(
                                item["icon"] as String,
                                item["label"] as String,
                                item["onTap"] as VoidCallback,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),

                  Divider(color: Colors.grey[700], thickness: 1),
                  SizedBox(height: 10.h),

                  // ✅ تسجيل الخروج
                  _buildMenuItem(
                    "assets/icons/logout.svg",
                    "Sign Out",
                    () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: const Color(0xFF3A3A3A),
                          title: Text(
                            'Sign Out',
                            style: AppTextStyles.ralewayMedium(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          content: Text(
                            'Do you want to sign out?',
                            style: AppTextStyles.ralewayRegular(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                signOut();
                              },
                              child: Text(
                                'Sign Out',
                                style: AppTextStyles.ralewayMedium(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    color: Colors.white,
                    showArrow: false,
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildMenuItem(
    String svgPath,
    String label,
    VoidCallback onTap, {
    Color color = Colors.white,
    bool showArrow = true,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        child: Row(
          children: [
            AppIcon(asset: svgPath, width: 22, height: 22),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.ralewayMedium(fontSize: 16, color: color),
              ),
            ),
            if (showArrow)
              Icon(Icons.arrow_forward_ios, color: color, size: 16.sp),
          ],
        ),
      ),
    );
  }
}
