import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity, // Ensure it takes the full width
        height: double.infinity, // Ensure it takes the full height
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange, Colors.deepOrange], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Align items to the top
          children: [
            // Align title.png to the top
            Padding(
              padding: const EdgeInsets.only(top: 50.0), // Adjust top padding as needed
              child: Image.asset(
                'assets/title.png',
                width: 350,
                height: 150, // Adjust the size as necessary
                fit: BoxFit.cover, // Ensure the image fits nicely
              ),
            ),
            // Add the new image below title.png with a circular border
            Padding(
              padding: const EdgeInsets.only(top: 20.0), // Add spacing if needed
              child: Container(
                width: 200, // Size of the circle
                height: 200, // Size of the circle
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Make the shape circular
                  border: Border.all(color: Colors.white, width: 4), // Border color and width
                  image: const DecorationImage(
                    image: AssetImage('assets/profile.jpeg'), // Change to your actual image path
                    fit: BoxFit.cover, // Ensure the image fits nicely
                  ),
                ),
              ),
            ),
            // Add the welcome text below the profile image
            const Padding(
              padding: EdgeInsets.only(top: 20.0), // Add spacing if needed
              child: Text(
                "Welcome back,\nEl Farras",
                style: TextStyle(
                  fontSize: 24, // Adjust the font size as necessary
                  fontWeight: FontWeight.bold, // Make the text bold
                  color: Colors.white, // White color for the text
                ),
                textAlign: TextAlign.center, // Center the text
              ),
            ),
            const Spacer(), // This pushes everything down
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/homepage');
              },
              child: const Text("Login"),
            ),
            const SizedBox(height: 50), // Add spacing at the bottom
          ],
        ),
      ),
    );
  }
}
