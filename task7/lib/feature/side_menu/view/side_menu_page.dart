import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user_model.dart';

class SidebarPage extends StatefulWidget {
  final int userId;
  const SidebarPage({super.key, required this.userId});

  @override
  State<SidebarPage> createState() => _SidebarPageState();
}

class _SidebarPageState extends State<SidebarPage> {
  User? user;
  bool _isLoading = true;


  

  // ✅ ستايل موحّد للنصوص
  final TextStyle menuTextStyle = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: Colors.white,
  );

  final TextStyle titleTextStyle = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
    color: Colors.white,
  );

  final TextStyle dialogTextStyle = TextStyle(
    fontFamily: 'Raleway',
    fontWeight: FontWeight.w500,
    fontSize: 14.sp,
    color: Colors.white70,
  );

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  Future<void> fetchUser() async {
    try {
      final response =
          await Dio().get('https://fakestoreapi.com/users/${widget.userId}');
      if (response.statusCode == 200) {
        setState(() {
          user = User.fromJson(response.data);
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  Future<void> signOut() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('authToken');
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF282828),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // صورة المستخدم
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.grey[300],
                      child: ClipOval(
                        child: Image.network(
                          user?.avatar ??
                              'https://ui-avatars.com/api/?name=${user?.getFullName()}',
                          width: 80.r,
                          height: 80.r,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/default_avatar.jpeg',
                              width: 80.r,
                              height: 80.r,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      user!.getFullName(),
                      style: titleTextStyle,
                    ),
                    SizedBox(height: 30.h),

                    // القائمة الجانبية
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [    
                            _buildMenuItem("assets/icons/profile1.svg", "Profile", () {}),
                            _buildMenuItem("assets/icons/cart_in_profile_page.svg", "My Cart", () {}),
                            _buildMenuItem("assets/icons/heart.svg", "Favorite", () {}),
                            _buildMenuItem("assets/icons/orders.svg", "Orders", () {}),
                            _buildMenuItem("assets/icons/notification.svg", "Notifications", () {}),
                            _buildMenuItem("assets/icons/setting.svg", "Settings", () {}),
                          ],
                        ),
                      ),
                    ),

                    Divider(color: Colors.grey[700], thickness: 1),
                    SizedBox(height: 10.h),

                    // تسجيل الخروج
                    _buildMenuItem("assets/icons/logout.svg", "Sign Out", () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: const Color(0xFF3A3A3A),
                          title: Text('Sign Out', style: titleTextStyle),
                          content: Text('Do you want to sign out?', style: dialogTextStyle),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                signOut();
                              },
                              child: Text('Sign Out', style: menuTextStyle),
                            ),
                          ],
                        ),
                      );
                    }, color: Colors.white, showArrow: false),
                  ],
                ),
              ),
            ),
    );
  }

  // ✅ دالة بناء عنصر القائمة مع SVG
  Widget _buildMenuItem(String svgPath, String label, VoidCallback onTap,
      {Color color = Colors.white, bool showArrow = true}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
        child: Row(
          children: [
            SvgPicture.asset(
              svgPath,
              width: 22.sp,
              height: 22.sp,
              colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                label,
                style: menuTextStyle,
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







////////////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'user_model.dart';

// class SidebarPage extends StatefulWidget {
//   final int userId;
//   const SidebarPage({super.key, required this.userId});

//   @override
//   State<SidebarPage> createState() => _SidebarPageState();
// }

// class _SidebarPageState extends State<SidebarPage> {
//   User? user;
//   bool _isLoading = true;

//   // ✅ ستايل موحّد للنصوص
//   final TextStyle menuTextStyle = TextStyle(
//     fontFamily: 'Raleway',
//     fontWeight: FontWeight.w500,
//     fontSize: 16.sp,
//     color: Colors.white,
//   );

//   final TextStyle titleTextStyle = TextStyle(
//     fontFamily: 'Raleway',
//     fontWeight: FontWeight.w600,
//     fontSize: 20.sp,
//     color: Colors.white,
//   );

//   final TextStyle dialogTextStyle = TextStyle(
//     fontFamily: 'Raleway',
//     fontWeight: FontWeight.w400,
//     fontSize: 14.sp,
//     color: Colors.white70,
//   );

//   @override
//   void initState() {
//     super.initState();
//     fetchUser();
//   }

//   Future<void> fetchUser() async {
//     try {
//       final response =
//           await Dio().get('https://fakestoreapi.com/users/${widget.userId}');
//       if (response.statusCode == 200) {
//         setState(() {
//           user = User.fromJson(response.data);
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.remove('authToken');
//       Navigator.pushReplacementNamed(context, '/login');
//     } catch (e) {
//       print("Error signing out: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF282828),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//                       radius: 40.r,
//                       backgroundColor: Colors.grey[300],
//                       child: ClipOval(
//                         child: Image.network(
//                           user?.avatar ??
//                               'https://ui-avatars.com/api/?name=${user?.getFullName()}',
//                           width: 80.r,
//                           height: 80.r,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Image.asset(
//                               'assets/images/default_avatar.jpeg',
//                               width: 80.r,
//                               height: 80.r,
//                               fit: BoxFit.cover,
//                             );
//                           },
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 12.h),
//                     Text(
//                       user!.getFullName(),
//                       style: titleTextStyle, // ✅ استخدام ستايل موحّد
//                     ),
//                     SizedBox(height: 30.h),

//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             _buildMenuItem("assets/icons/profile.svg", "Profile", () {}),
//                             _buildMenuItem("assets/icons/cart.svg", "My Cart", () {}),
//                             _buildMenuItem("assets/icons/favorite.svg", "Favorite", () {}),
//                             _buildMenuItem("assets/icons/orders.svg", "Orders", () {}),
//                             _buildMenuItem("assets/icons/notification.svg", "Notifications", () {}),
//                             _buildMenuItem("assets/icons/setting.svg", "Settings", () {}),
//                           ],
//                         ),
//                       ),
//                     ),

//                     Divider(color: Colors.grey[700], thickness: 1),
//                     SizedBox(height: 10.h),

//                     _buildMenuItem("assets/icons/logout.svg", "Sign Out", () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           backgroundColor: const Color(0xFF3A3A3A),
//                           title: Text('Sign Out', style: titleTextStyle),
//                           content: Text('Do you want to sign out?', style: dialogTextStyle),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 signOut();
//                               },
//                               child: Text('Sign Out', style: menuTextStyle),
//                             ),
//                           ],
//                         ),
//                       );
//                     }, color: Colors.white, showArrow: false),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildMenuItem(String svgPath, String label, VoidCallback onTap,
//       {Color color = Colors.white, bool showArrow = true}) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
//         child: Row(
//           children: [
//             SvgPicture.asset(
//               svgPath,
//               width: 22.sp,
//               height: 22.sp,
//               colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
//             ),
//             SizedBox(width: 16.w),
//             Expanded(
//               child: Text(
//                 label,
//                 style: menuTextStyle, // ✅ استخدام ستايل موحّد
//               ),
//             ),
//             if (showArrow)
//               Icon(Icons.arrow_forward_ios, color: color, size: 16.sp),
//           ],
//         ),
//       ),
//     );
//   }
// }







////////////
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'user_model.dart';

// class SidebarPage extends StatefulWidget {
//   final int userId;
//   const SidebarPage({super.key, required this.userId});

//   @override
//   State<SidebarPage> createState() => _SidebarPageState();
// }

// class _SidebarPageState extends State<SidebarPage> {
//   User? user;
//   bool _isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchUser();
//   }

//   Future<void> fetchUser() async {
//     try {
//       final response =
//           await Dio().get('https://fakestoreapi.com/users/${widget.userId}');
//       if (response.statusCode == 200) {
//         setState(() {
//           user = User.fromJson(response.data);
//           _isLoading = false;
//         });
//       }
//     } catch (e) {
//       setState(() => _isLoading = false);
//     }
//   }

//   Future<void> signOut() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.remove('authToken');
//       Navigator.pushReplacementNamed(context, '/login');
//     } catch (e) {
//       print("Error signing out: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF282828),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : SafeArea(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CircleAvatar(
//   radius: 40.r,
//   backgroundColor: Colors.grey[300],
//   child: ClipOval(
//     child: Image.network(
//       user?.avatar ?? 'https://ui-avatars.com/api/?name=${user?.getFullName()}',
//       width: 80.r,
//       height: 80.r,
//       fit: BoxFit.cover,
//       errorBuilder: (context, error, stackTrace) {
//         return Image.asset(
//           'assets/images/default_avatar.jpeg',
//           width: 80.r,
//           height: 80.r,
//           fit: BoxFit.cover,
//         );
//       },
//     ),
//   ),
// ),
//                     // صورة المستخدم والاسم
// //                     CircleAvatar(
// //   radius: 40.r,
// //   backgroundColor: Colors.grey[300],
// //   child: ClipOval(
// //     child: Image.network(
// //       "https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_hybrid&w=740&q=80",
// //       fit: BoxFit.cover,
// //       errorBuilder: (context, error, stackTrace) {
// //         return Image.asset(
// //           'assets/images/default_avatar.jpeg',
// //           fit: BoxFit.cover,
// //         );
// //       },
// //     ),
// //   ),
// // ),

//                     // CircleAvatar(
//                     //   radius: 40.r,
//                     //   backgroundImage: NetworkImage(user!.avatar),
//                     //   backgroundColor: Colors.grey[300],
//                     // ),
//                     SizedBox(height: 12.h),
//                     Text(
//                       user!.getFullName(),
//                       style: TextStyle(
//                         fontSize: 20.sp,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                     SizedBox(height: 30.h),

//                     // القائمة الجانبية
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Column(
//                           children: [
//                             _buildMenuItem(Icons.person, "Profile", () {}),
//                             _buildMenuItem(Icons.shopping_cart, "My Cart", () {}),
//                             _buildMenuItem(Icons.favorite, "Favorite", () {}),
//                             _buildMenuItem(Icons.list_alt, "Orders", () {}),
//                             _buildMenuItem(Icons.notifications, "Notifications", () {}),
//                             _buildMenuItem(Icons.settings, "Settings", () {}),
//                           ],
//                         ),
//                       ),
//                     ),

//                     Divider(color: Colors.grey[700], thickness: 1),
//                     SizedBox(height: 10.h),

//                     _buildMenuItem( SvgPicture.asset(
//       'assets/icons/logout.svg',
//       width: 14.33.w,
//       height: 14.33.h,
//     ) as IconData, "Sign Out", () {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           backgroundColor: const Color(0xFF3A3A3A),
//                           title: Text('Sign Out', style: TextStyle(color: Colors.white)),
//                           content: Text('Do you want to sign out?',
//                               style: TextStyle(color: Colors.white70)),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context);
//                                 signOut();
//                               },
//                               child: Text('Sign Out',
//                                   style: TextStyle(color: Colors.white)), // أبيض
//                             ),
//                           ],
//                         ),
//                       );
//                     }, color: Colors.white, showArrow: false),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }

//   Widget _buildMenuItem(IconData icon, String label, VoidCallback onTap,
//       {Color color = Colors.white, bool showArrow = true}) {
//     return InkWell(
//       onTap: onTap,
//       child: Padding(
//         padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 12.w),
//         child: Row(
//           children: [
//             Icon(icon, color: color, size: 22.sp),
//             SizedBox(width: 16.w),
//             Expanded(
//               child: Text(
//                 label,
//                 style: TextStyle(
//                   fontSize: 16.sp,
//                   color: color,
//                 ),
//               ),
//             ),
//             if (showArrow)
//               Icon(Icons.arrow_forward_ios, color: color, size: 16.sp),
//           ],
//         ),
//       ),
//     );
//   }
// }

