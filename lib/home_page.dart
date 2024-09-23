import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apps_food/controller/bottom_nav_controller.dart';
import 'package:apps_food/menus/discover.dart';
import 'package:apps_food/menus/home.dart';
import 'package:apps_food/menus/favorites.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController bottomNavController = Get.put(BottomNavController());

    final List<Widget> menus = [
      const Home(),
      const Discover(),
      const Favorites(),
    ];

    return Obx(() {
      return Scaffold(
        body: menus[bottomNavController.selectedIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: bottomNavController.selectedIndex.value,
          onTap: bottomNavController.changeIndexMenu,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined), 
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined), 
              label: "Discover"
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), 
              label: "Favorites"
            ),
          ],
        ),
      );
    });
  }
}
