import 'package:flutter/material.dart';
import 'package:apps_food/widgets/restaurant_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Restaurants"),
      ),
      body: ListView(
        children: [
          // Profile Card
          Container(
            color: Colors.white, // Set background color for the profile card
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                // Profile Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.asset(
                    'assets/profile.jpeg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16), // Add spacing between image and text
                // Profile Details (Username and Foodie Level)
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'El Farras',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Foodie Level: 10',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Restaurant Cards
          const RestaurantCard(
            imageUrl: 'assets/cafe.jpeg',
            restaurantName: 'Luminous Cafe',
            distance: 0.5,
          ),
          const RestaurantCard(
            imageUrl: 'assets/esteh.jpg',
            restaurantName: 'Teh Kutha',
            distance: 1.2,
          ),
          const RestaurantCard(
            imageUrl: 'assets/fedchiken.jpeg',
            restaurantName: 'Pragos Fried Chicken',
            distance: 2.0,
          ),
          const RestaurantCard(
            imageUrl: 'assets/pozza.jpg',
            restaurantName: 'Pizza Mamamia',
            distance: 0.9,
          ),
          const RestaurantCard(
            imageUrl: 'assets/shawarma.jpeg',
            restaurantName: 'Abdul`s Shawarma',
            distance: 1.8,
          ),
        ],
      ),
    );
  }
}
