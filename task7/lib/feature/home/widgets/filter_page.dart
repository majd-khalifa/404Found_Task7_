// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task7/core/style/textstyle.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/my_button.dart';

class FilterPage extends StatefulWidget {
  final List<String> categories;
  final Function(List<String>, RangeValues) onApply;

  const FilterPage({
    super.key,
    required this.categories,
    required this.onApply,
  });

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  List<String> selectedCategories = [];
  RangeValues priceRange = const RangeValues(0, 1000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Filter", showBack: true),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              "Select Categories",
              style: AppTextStyles.ralewaySemiBold(fontSize: 16.sp),
            ),
            SizedBox(height: 12.h),
            Wrap(
              spacing: 10.w,
              children: widget.categories.map((cat) {
                final isSelected = selectedCategories.contains(cat);
                return FilterChip(
                  label: Text(cat),
                  selected: isSelected,
                  selectedColor: Colors.green.withOpacity(0.3),
                  onSelected: (value) {
                    setState(() {
                      if (value) {
                        selectedCategories.add(cat);
                      } else {
                        selectedCategories.remove(cat);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 30.h),
            Text(
              "Price Range",
              style: AppTextStyles.ralewaySemiBold(fontSize: 16.sp),
            ),
            RangeSlider(
              values: priceRange,
              min: 0,
              max: 1000,
              divisions: 100,
              labels: RangeLabels(
                "\$${priceRange.start.round()}",
                "\$${priceRange.end.round()}",
              ),
              onChanged: (values) {
                setState(() {
                  priceRange = values;
                });
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: MyButton(
                widget: Text("Apply Filters"),
                color: Colors.green,
                onPressed: () {
                  widget.onApply(selectedCategories, priceRange);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
