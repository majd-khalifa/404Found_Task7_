// ignore_for_file: use_build_context_synchronously, avoid_print, avoid_unnecessary_containers

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task7/core/style/colors/color.dart';
import 'package:task7/core/style/textstyle.dart';
import 'package:task7/core/widgets/my_bottom.dart';
import 'package:task7/core/widgets/mytextformfield.dart';
import 'package:task7/feature/auth/signin/data/signin_service.dart';
import 'package:task7/feature/auth/signin/model/login_request.dart';
import 'package:task7/feature/auth/signup/view/signup_page.dart';
import 'package:task7/feature/auth/widgets/my_password_field.dart';
import 'package:task7/feature/auth/widgets/show_snackbar.dart';
import 'package:task7/feature/home/view/home_page.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final formKey = GlobalKey<FormState>();
  final usernamcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  bool isloading = false;
  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    setState(() {
      isloading = true;
    });
    final signinservice = SigninService();
    final req = LoginRequest(
      username: usernamcontroller.text,
      password: passwordcontroller.text,
    );
    try {
      // ignore: unused_local_variable
      final res = await signinservice.login(req);

      Snackbar.show(
        context,
        "Login successful",
        backgroundColor: mygreen,
        textColor: mywhite,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      print(e);
      Snackbar.show(
        context,
        "Login failed: $e",
        backgroundColor: myred,
        textColor: mywhite,
      );
    } finally {
      setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 1.sw,
          height: 1.sh,
          color: mywhite,
          child: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 23.h, right: 20),
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
                          onPressed: () {},
                          icon: SvgPicture.asset("assets/icons/back.svg"),
                        ),
                      ),
                    ),
                    11.verticalSpace,
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Hello Again!",
                              textAlign: TextAlign.center,
                              style: AppTextStyles.ralewayBold(
                                fontSize: 32.sp,
                                letterSpacing: 0,
                                height: 1,
                              ),
                            ),
                          ),
                          8.verticalSpace,
                          Center(
                            child: Text(
                              "Fill your details or continue with\nsocial media",
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
                    30.verticalSpace,
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "User Name",
                            style: AppTextStyles.ralewayMedium(
                              color: mylight,
                              fontSize: 16.sp,
                              height: 1.25.h,
                            ),
                          ),
                          12.verticalSpace,
                          Mytextformfield(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }

                              // final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              // if (!emailRegex.hasMatch(value)) {
                              //   return 'Enter a valid email address';
                              // }
                              return null;
                            },
                            controller: usernamcontroller,
                            hinttext: "xxxxxxxx",
                            letterspacing: 2,
                          ),
                          30.verticalSpace,
                          Text(
                            "Password",
                            style: AppTextStyles.ralewayMedium(
                              color: mylight,
                              fontSize: 16,
                              height: 1.25.h,
                            ),
                          ),
                          12.verticalSpace,
                          PasswordField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter a password';
                              }
                              if (value.length < 6) {
                                return 'Password must be at least 6 characters';
                              }
                              // if (!RegExp(r'[A-Z]').hasMatch(value)) {
                              //   return 'Password must contain at least one uppercase letter';
                              // }
                              // if (!RegExp(r'[0-9]').hasMatch(value)) {
                              //   return 'Password must contain at least one number';
                              // }
                              return null;
                            },
                            hinttext: "••••••••",
                            controller: passwordcontroller,
                          ),
                          12.verticalSpace,
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Recovery Password",
                              style: AppTextStyles.poppinsRegular(
                                color: recoverypasscolor,
                                fontSize: 12.sp,
                                height: (16 / 12).h,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    24.verticalSpace,
                    Mybottom(
                      color: mygreen,
                      widget: isloading
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                              "Sign In",
                              style: AppTextStyles.ralewaySemiBold(
                                fontSize: 14.sp,
                                height: (22 / 14).h,
                                color: mywhite,
                              ),
                            ),
                      onPressed: isloading ? null : login,
                    ),
                    24.verticalSpace,
                    Mybottom(
                      color: backgroundcolour,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/icons/google.svg"),
                          14.horizontalSpace,
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
                    135.verticalSpace,
                    Center(
                      child: RichText(
                        text: TextSpan(
                          text: "New User? ",
                          style: AppTextStyles.ralewayMedium(
                            fontSize: 16.sp,
                            height: 1.h,
                            color: mygray,
                            letterSpacing: 0,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: "Create Account",
                              style: AppTextStyles.ralewayMedium(
                                color: spancolor,
                                height: 1.h,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SignupPage(),
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
      ),
    );
  }
}
