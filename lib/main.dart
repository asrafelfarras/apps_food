import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apps_food/home_page.dart';
import 'package:apps_food/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const LoginPage()),
        GetPage(name: '/homepage', page: () => const HomePage()),
      ],
    );
  }
}
