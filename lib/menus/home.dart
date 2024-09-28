import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apps_food/controller/bottom_nav_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.find(); // Ambil instance controller

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ini sub menu page Home"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.changeIndexMenu(1); // Ubah indeks menu
              },
              child: const Text('Go to Search Page (Index 1)'),
            ),
          ],
        ),
      ),
    );
  }
}