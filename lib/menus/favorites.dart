import 'package:flutter/material.dart';
import 'package:apps_food/database_helper.dart';
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
    final favorites = await DatabaseHelper().getFavorites();
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
