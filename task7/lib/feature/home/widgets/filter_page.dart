// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBar: AppBar(
        title: const Text("Filter"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Categories",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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
            SizedBox(height: 24.h),
            Text(
              "Price Range",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
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
              child: ElevatedButton(
                onPressed: () {
                  widget.onApply(selectedCategories, priceRange);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                ),
                child: const Text("Apply Filters"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
