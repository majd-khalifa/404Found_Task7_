import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'feature/cart/provider/cart_provider.dart';
import 'feature/home/provider/home_provider.dart';
import 'feature/home/data/home_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => CartProvider()),
            ChangeNotifierProvider(
              create: (_) => HomeProvider(HomeRepository())..loadProducts(),
            ),
          ],
          child: const App(),
        );
      },
    );
  }
}
