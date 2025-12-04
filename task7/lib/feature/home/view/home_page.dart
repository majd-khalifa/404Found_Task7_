import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task7/feature/side_menu/view/side_menu_page.dart';
import 'custom_app_bar.dart';
import 'home_header.dart';
import 'home_body.dart';
import '../../../core/widgets/custom_bottom_nav_bar.dart';
import '../widgets/filter_page.dart';
import '../provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<HomeProvider>();

    return Scaffold(
      drawer: Theme(
        data: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xFF282828),
          dividerColor: Colors.grey[700],
          iconTheme: const IconThemeData(color: Colors.white),
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
          ),
        ),
        child: Drawer(child: SidebarPage(userId: 1)),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: provider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomAppBar(),
                      SizedBox(height: 16.h),
                      HomeHeader(
                        onCategorySelected: provider.setCategory,
                        selectedCategory:
                            provider.selectedCategories?.isNotEmpty == true
                            ? provider.selectedCategories!.first
                            : null,
                        onFilterPressed: () async {
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FilterPage(
                                categories: provider.products
                                    .map((p) => p.category)
                                    .toSet()
                                    .toList(),
                                onApply: provider.setFilter,
                              ),
                            ),
                          );
                        },
                        onSearch: provider.setSearch,
                      ),
                      SizedBox(height: 24.h),
                      HomeBody(
                        products: provider.products,
                        selectedCategories: provider.selectedCategories,
                        selectedPriceRange: provider.selectedPriceRange,
                        searchQuery: provider.searchQuery,
                      ),
                    ],
                  ),
                ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(activePage: 0),
    );
  }
}
