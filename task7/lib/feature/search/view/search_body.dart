// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:task7/core/style/textstyle.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> history = [
      "New T-Shirt",
      "Top T-shirt",
      "Programmer",
      "Shirt",
      "Black Shirt",
      "White Shirt",
    ];

    return Expanded(
      child: Material(
        // ← تمت إضافة هذا فقط
        color: Colors.transparent,
        child: ListView.builder(
          itemCount: history.length,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(
                Icons.access_time,
                weight: 16.5,
                color: Color(0xFF707B81),
              ),
              title: Text(
                history[index],
                style: AppTextStyles.ralewayMedium(
                  fontSize: 14,
                  color: const Color(0xFF2B2B2B),
                ),
              ),
              onTap: () {
                print("Selected: ${history[index]}");
              },
            );
          },
        ),
      ),
    );
  }
}
