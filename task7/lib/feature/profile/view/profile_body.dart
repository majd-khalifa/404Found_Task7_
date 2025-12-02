import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:task7/core/network/api_constants.dart';
import 'package:task7/core/style/textstyle.dart';
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
      final response = await dio.get("${ApiConstants.users}/$id");
      if (response.statusCode == 200) {
        setState(() {
          user = User.fromJson(response.data);
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("خطأ في جلب البيانات: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : user == null
              ? const Center(child: Text("لا يوجد بيانات"))
              : SingleChildScrollView(
                  padding: EdgeInsets.all(24.w),
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
        backgroundImage: NetworkImage(user!.avatar),
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
          ),
          padding: EdgeInsets.all(6.w),
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 10.sp,
          ),
        ),
      ),
    ],
  ),
),
                      SizedBox(height: 22.h),

                      
                      _buildField("Your Name", user!.username),
                      SizedBox(height: 12.h),

                      
                      _buildField("Email Address", user!.email),
                      SizedBox(height: 12.h),


                      _buildField("Password", "••••••••"),
                      SizedBox(height: 12.h),

                      
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
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
                      SizedBox(height: 30.h),

                      // زر الحفظ
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Save Now",
                             style: AppTextStyles.ralewaySemiBold(
                             fontSize: 14.sp,
                            color: Colors.white,
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
    );
  }

  // دالة لبناء الحقول بخلفية رمادية والنص فوق الحقل
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
