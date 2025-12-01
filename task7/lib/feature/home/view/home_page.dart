import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'custom_app_bar.dart';
import 'home_header.dart';
import 'home_body.dart';
import '../model/home_product_model.dart';
import '../data/home_repository.dart';
import '../../../core/widgets/custom_bottom_nav_bar.dart';
import 'filter_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String>? selectedCategories;
  RangeValues? selectedPriceRange;
  String? searchQuery; // ✅ نص البحث

  @override
  Widget build(BuildContext context) {
    final repo = HomeRepository();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: FutureBuilder<List<HomeProductModel>>(
              future: repo.getProducts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final products = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(),
                    SizedBox(height: 16.h),
                    HomeHeader(
                      onCategorySelected: (category) {
                        setState(() {
                          selectedCategories = [category];
                        });
                      },
                      selectedCategory: selectedCategories?.isNotEmpty == true
                          ? selectedCategories!.first
                          : null,
                      onFilterPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => FilterPage(
                              categories: products
                                  .map((p) => p.category)
                                  .toSet()
                                  .toList(),
                              onApply: (cats, range) {
                                setState(() {
                                  selectedCategories = cats;
                                  selectedPriceRange = range;
                                });
                              },
                            ),
                          ),
                        );
                      },
                      onSearch: (query) {
                        setState(() {
                          searchQuery = query;
                        });
                      },
                    ),
                    SizedBox(height: 24.h),
                    HomeBody(
                      products: products,
                      selectedCategories: selectedCategories,
                      selectedPriceRange: selectedPriceRange,
                      searchQuery: searchQuery, // ✅ مرر البحث
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
