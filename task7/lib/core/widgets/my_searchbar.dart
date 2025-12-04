//search bar that exsist in home page and search page
// ignore_for_file: avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = TextEditingController();

  List<String> history = [
    "New T-Shirt",
    "Top T-shirt",
    "Programmer",
    "Shirt",
    "Black Shirt",
    "White Shirt",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,

        title: Row(
          children: [
            Container(
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, size: 18),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Search",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 30),

            TextButton(
              onPressed: () {
                controller.clear();
              },
              child: const Text(
                "Cancel",
                style: TextStyle(color: Colors.green, fontSize: 16),
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 52,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF3F3F3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.grey),

                  const SizedBox(width: 8),

                  Expanded(
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Search Your Shirt",
                        border: InputBorder.none,
                      ),
                    ),
                  ),

                  IconButton(
                    icon: const Icon(Icons.mic_none, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            const Text(
              "Shirt",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.access_time, size: 22),
                    title: Text(
                      history[index],
                      style: const TextStyle(fontSize: 16),
                    ),
                    onTap: () {
                      print("Selected: ${history[index]}");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
