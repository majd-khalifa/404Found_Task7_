import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/widgets/custom_app_bar.dart';
import 'profile_body.dart';

class ProfilePage extends StatelessWidget {
  final int userId;

  const ProfilePage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: const CustomAppBar(
        title: "Profile",
        showBack: true,
        backIconPath: "assets/icons/back_in_grey.svg",
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              SizedBox(
                height: 600.h,
                child: ProfileBody(userId: userId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
