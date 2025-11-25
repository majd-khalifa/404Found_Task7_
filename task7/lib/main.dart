import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'task7',
      debugShowCheckedModeBanner: false, // hides the debug banner
      home: Scaffold(
        appBar: AppBar(title: const Text('Task 7')), // optional app bar
        body: const Center(
          child: Text(
            'Hello Majd',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
