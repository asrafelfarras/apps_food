import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("ini login"),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/homepage');
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
