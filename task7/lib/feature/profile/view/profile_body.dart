// ignore_for_file: use_super_parameters, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:task7/core/errors/error_message.dart';
import 'package:task7/core/network/api_constants.dart';
import 'package:task7/core/style/textstyle.dart';
import 'package:task7/core/widgets/my_button.dart';
import 'package:task7/feature/profile/model/user_model.dart';

class ProfileBody extends StatefulWidget {
  final int userId;

  const ProfileBody({Key? key, required this.userId}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileBody> {
  User? user;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchUser(widget.userId);
  }

  Future<void> _fetchUser(int id) async {
    try {
      final dio = Dio();
      final url = "${ApiConstants.authurl}/users/$id";

      final response = await dio.get(url);

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
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: ErrorMessages.fetchError(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (user == null) {
      return ErrorMessages.noData();
    }

    return SingleChildScrollView(
      padding: EdgeInsets.all(12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40.h),

          Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 60.r,
                  backgroundImage: NetworkImage(user!.image),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    padding: EdgeInsets.all(6.w),
                    child: Icon(
                      Icons.verified,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 22.h),

          _buildField("Your Name", user!.getFullName()),
          SizedBox(height: 12.h),

          _buildField("Email Address", user!.email),
          SizedBox(height: 12.h),

          _buildField("Password", "••••••••"),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              onPressed: () {},
              child: Text(
                "Recovery Password",
                style: AppTextStyles.poppinsRegular(
                  fontSize: 12.sp,
                  color: const Color(0xFF707B81),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.h),

          MyButton(
            color: Colors.green,
            widget: Text(
              "Save Now",
              style: AppTextStyles.ralewaySemiBold(
                fontSize: 14.sp,
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Changes saved successfully")),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.ralewaySemiBold(
            fontSize: 16.sp,
            color: const Color(0xFF707B81),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          height: 48.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: const Color(0xFFF7F7F9),
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Text(
            value,
            style: AppTextStyles.poppinsMedium(
              fontSize: 14.sp,
              color: const Color(0xFF2B2B2B),
            ),
          ),
        ),
      ],
    );
  }
}
