import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_app_bar.dart';
import 'home_header.dart';
import 'home_body.dart';
import '../model/home_product_model.dart';
import '../data/home_repository.dart';
import 'package:dio/dio.dart';
import '../../../core/network/api_consumer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = HomeRepository(ApiConsumer(Dio()));

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FutureBuilder<List<HomeProductModel>>(
              future: repo.getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox(
                    height: 400.h,
                    child: const Center(child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error: ${snapshot.error}", // ✅ يظهر الخطأ بدل ما ينهار التطبيق
                      style: TextStyle(fontSize: 14.sp, color: Colors.red),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text(
                      "No products found",
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(),
                      SizedBox(height: 16.h),
                      const HomeHeader(),
                      SizedBox(height: 24.h),
                      HomeBody(products: snapshot.data!),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
