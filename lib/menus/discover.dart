import 'package:flutter/material.dart';
import 'package:apps_food/widgets/restaurant_card.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  final List<RestaurantCard> allRestaurants = [
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
    const RestaurantCard(
      imageUrl: 'assets/bakso.jpeg',
      restaurantName: 'Bakso Pak Kumis',
      distance: 5,
    ),
    const RestaurantCard(
      imageUrl: 'assets/ramen.jpeg',
      restaurantName: 'Ramen Ichiban',
      distance: 7,
    ),
    const RestaurantCard(
      imageUrl: 'assets/sushi.jpeg',
      restaurantName: 'Sushi Kouji',
      distance: 5,
    ),
    const RestaurantCard(
      imageUrl: 'assets/steakhouse.jpeg',
      restaurantName: 'Astolfo Steakhouse',
      distance: 15,
    ),
    const RestaurantCard(
      imageUrl: 'assets/burger.jpeg',
      restaurantName: 'Big Burger Corp.',
      distance: 8,
    ),
    const RestaurantCard(
      imageUrl: 'assets/pasta.jpeg',
      restaurantName: 'Pasta la Ventus',
      distance: 6,
    ),
    const RestaurantCard(
      imageUrl: 'assets/dimsum.jpeg',
      restaurantName: 'Dim Some',
      distance: 6.5,
    ),
  ];

  List<RestaurantCard> filteredRestaurants = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredRestaurants = allRestaurants;
  }

  void _filterRestaurants(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredRestaurants = allRestaurants;
      });
      return;
    }

    final exactMatches = allRestaurants.where((restaurant) {
      return restaurant.restaurantName.toLowerCase().startsWith(query.toLowerCase());
    }).toList();

    final partialMatches = allRestaurants.where((restaurant) {
      return !restaurant.restaurantName.toLowerCase().startsWith(query.toLowerCase()) &&
             restaurant.restaurantName.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredRestaurants = [...exactMatches, ...partialMatches];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Discover Restaurants"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                searchQuery = value;
                _filterRestaurants(searchQuery);
              },
              decoration: InputDecoration(
                hintText: 'Search Restaurants...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                return filteredRestaurants[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
