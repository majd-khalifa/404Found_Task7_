// ignore_for_file: unused_local_variable, avoid_unnecessary_containers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task7/core/network/api_constants.dart';
import 'package:task7/core/network/api_consumer.dart';

import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';
import 'package:task7/core/widgets/my_button.dart';
import 'package:task7/core/widgets/mytextformfield.dart';
import 'package:task7/feature/auth/signin/view/signin_page.dart';
import 'package:task7/feature/auth/signup/model/signup_request.dart';
import 'package:task7/feature/auth/widgets/my_password_field.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final ApiConsumer api = ApiConsumer(ApiConstants.authurl);

  bool isloading = false;
  Future<void> signup() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isloading = true);

    try {
      final req = SignupRequest(
        username: usernamecontroller.text,
        email: emailcontroller.text,
        password: passwordcontroller.text,
      );

      // final data = await api.post('/auth/signup', body: req.toJson());

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Account created ')));

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => SigninPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Signup failed: $e')));
    } finally {
      setState(() => isloading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mywhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 23.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(40.r),
                    child: Container(
                      width: 44.w,
                      height: 44.h,
                      color: backgroundcolour,
                      child: IconButton(
                        iconSize: 44.sp,
                        onPressed: () {},
                        icon: SvgPicture.asset("assets/icons/back.svg"),
                      ),
                    ),
                  ),
                  SizedBox(height: 11.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Register Account",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.ralewayBold(
                              fontSize: 32.sp,
                              letterSpacing: 0,
                            ),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.only(left: 17.w),
                          child: Text(
                            "Fill your details or continue with\n social media",
                            textAlign: TextAlign.center,
                            style: AppTextStyles.poppinsRegular(
                              color: mylightgray,
                              fontSize: 16.sp,
                              letterSpacing: 0,
                              height: 1.5.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Name",
                          style: AppTextStyles.ralewayMedium(
                            color: mylight,
                            fontSize: 16.sp,
                            height: 1.25.h,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Mytextformfield(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            if (value.length < 3) {
                              return 'Username must be at least 3 characters';
                            }
                            if (value.length > 20) {
                              return 'Username must not exceed 20 characters';
                            }
                            // Regex: يسمح بالأحرف والأرقام والـ underscore فقط
                            final usernameRegex = RegExp(r'^[a-zA-Z0-9_]+$');
                            if (!usernameRegex.hasMatch(value)) {
                              return 'Username can only contain letters, numbers, and underscores';
                            }
                            return null;
                          },
                          hinttext: 'xxxxxxxx',
                          letterspacing: 2,
                          controller: usernamecontroller,
                        ),

                        SizedBox(height: 30.h),
                        Text(
                          "Email Address",
                          style: AppTextStyles.ralewayMedium(
                            color: mylight,
                            fontSize: 16.sp,
                            height: 1.25.h,
                          ),
                        ),
                        Mytextformfield(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }

                            final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                            if (!emailRegex.hasMatch(value)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                          hinttext: "xyz@gmail.com",
                          letterspacing: 0,
                          controller: emailcontroller,
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          "Password",
                          style: AppTextStyles.ralewayMedium(
                            color: mylight,
                            fontSize: 16,
                            height: 1.25.h,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        PasswordField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            if (value.length < 6) {
                              return 'Password must be at least 6 characters';
                            }
                            if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              return 'Password must contain at least one uppercase letter';
                            }
                            if (!RegExp(r'[0-9]').hasMatch(value)) {
                              return 'Password must contain at least one number';
                            }
                            return null;
                          },
                          hinttext: "••••••••",
                          controller: passwordcontroller,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h),
                  MyButton(
                    color: mygreen,
                    widget: isloading
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Sign Up",
                            style: AppTextStyles.ralewaySemiBold(
                              fontSize: 14.sp,
                              height: (22 / 14).h,
                              color: mywhite,
                            ),
                          ),
                    onPressed: isloading ? null : signup,
                  ),
                  SizedBox(height: 24.h),
                  MyButton(
                    color: backgroundcolour,
                    widget: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/google.svg"),
                        SizedBox(width: 14.w),
                        Text(
                          "Sign up with Google",
                          style: AppTextStyles.ralewaySemiBold(
                            fontSize: 14.sp,
                            height: (22 / 14).h,
                            color: myblack,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () async {},
                  ),
                  SizedBox(height: 55.h),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Already Have Account? ",
                        style: AppTextStyles.ralewayMedium(
                          fontSize: 16.sp,
                          height: 1.h,
                          color: mygray,
                          letterSpacing: 0,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Log In",
                            style: AppTextStyles.ralewayMedium(
                              color: spancolor,
                              height: 1.h,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SigninPage(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
