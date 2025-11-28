import 'package:flutter/material.dart';
import 'core/style/apptheme/apptheme.dart';
import 'feature/home/view/home_page.dart';
import 'feature/favorites/view/favorites_page.dart';
import 'feature/notifications/view/notifications_page.dart';
import 'feature/profile/view/profile_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task 7',
      theme: AppTheme.lightTheme,
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/favorites': (context) => const FavoritesPage(),
        '/notifications': (context) => const NotificationsPage(),
        '/profile': (context) => const ProfilePage(),
      },
    );
  }
}
