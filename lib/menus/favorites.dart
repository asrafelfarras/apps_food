import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apps_food/widgets/restaurant_card.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  FavoritesState createState() => FavoritesState();
}

class FavoritesState extends State<Favorites> {
  List<Map<String, dynamic>> favoriteRestaurants = [];

  @override
  void initState() {
    super.initState();
    _loadFavoriteRestaurants();
  }

  Future<void> _loadFavoriteRestaurants() async {
    final prefs = await SharedPreferences.getInstance();

    List<Map<String, dynamic>> favorites = [];

    Map<String, Map<String, dynamic>> allRestaurants = {
      'Luminous Cafe': {'imageUrl': 'assets/cafe.jpeg', 'distance': 0.5},
      'Teh Kutha': {'imageUrl': 'assets/esteh.jpg', 'distance': 1.2},
      'Pragos Fried Chicken': {'imageUrl': 'assets/fedchiken.jpeg', 'distance': 2.0},
      'Pizza Mamamia': {'imageUrl': 'assets/pozza.jpg', 'distance': 0.9},
      'Abdul`s Shawarma': {'imageUrl': 'assets/shawarma.jpeg', 'distance': 1.8},
    };

    // Check for each restaurant if it is favorited
    for (var restaurant in allRestaurants.entries) {
      if (prefs.getBool(restaurant.key) == true) {
        favorites.add({
          'restaurantName': restaurant.key,
          'imageUrl': restaurant.value['imageUrl'],
          'distance': restaurant.value['distance'],
        });
      }
    }

    setState(() {
      favoriteRestaurants = favorites;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite Restaurants"),
      ),
      body: favoriteRestaurants.isEmpty
          ? const Center(child: Text('No favorite restaurants yet.'))
          : ListView.builder(
              itemCount: favoriteRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = favoriteRestaurants[index];
                return RestaurantCard(
                  imageUrl: restaurant['imageUrl'],
                  restaurantName: restaurant['restaurantName'],
                  distance: restaurant['distance'],
                );
              },
            ),
    );
  }
}
