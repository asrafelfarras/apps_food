import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.asset(
                  'assets/profile.jpeg',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            
            // Email
            const Center(
              child: Text(
                'Email: elfarras1304@gmail.com',
                style: TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),

            // Level Bar
            const Text(
              'Foodie Level',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: 0.8, // 80% progress, you can change this value dynamically
              backgroundColor: Colors.grey[300],
              color: Colors.green,
              minHeight: 10,
            ),
            const SizedBox(height: 8),
            const Text('Expert'), // Level text below the bar

            // Spacing
            const SizedBox(height: 32),

            // Other Profile Details (You can add more details here if needed)
          ],
        ),
      ),
    );
  }
}
