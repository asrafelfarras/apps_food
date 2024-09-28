import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RestaurantCard extends StatefulWidget {
  final String imageUrl;
  final String restaurantName;
  final double distance;

  const RestaurantCard({
    Key? key,
    required this.imageUrl,
    required this.restaurantName,
    required this.distance,
  }) : super(key: key);

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _loadFavoriteStatus();
  }

  Future<void> _loadFavoriteStatus() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = prefs.getBool(widget.restaurantName) ?? false;
    });
  }

  Future<void> _toggleFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isFavorite = !isFavorite;
      prefs.setBool(widget.restaurantName, isFavorite);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.asset(
            widget.imageUrl,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restaurantName,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('${widget.distance} km away'),
                ],
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
            onPressed: _toggleFavorite,
          ),
        ],
      ),
    );
  }
}
