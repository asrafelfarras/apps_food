import 'package:flutter/material.dart';
import 'package:apps_food/database_helper.dart';

class RestaurantCard extends StatefulWidget {
  final String imageUrl;
  final String restaurantName;
  final double distance;

  const RestaurantCard({
    super.key,
    required this.imageUrl,
    required this.restaurantName,
    required this.distance,
  });

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
    final favorites = await DatabaseHelper().getFavorites();
    setState(() {
      isFavorite = favorites.any((favorite) => favorite['restaurantName'] == widget.restaurantName);
    });
  }

  Future<void> _toggleFavorite() async {
    if (isFavorite) {
      // Show confirmation dialog before un-favoriting
      final confirmed = await _showUnfavoriteDialog();
      if (!confirmed) return; // User did not confirm, exit
      await DatabaseHelper().deleteFavorite(widget.restaurantName);
    } else {
      await DatabaseHelper().insertFavorite({
        'restaurantName': widget.restaurantName,
        'imageUrl': widget.imageUrl,
        'distance': widget.distance,
      });
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  Future<bool> _showUnfavoriteDialog() async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Unfavorite'),
          content: const Text('Apakah anda ingin menghapus restoran ini dari favorites?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // Return false
              child: const Text('Tidak'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), // Return true
              child: const Text('Iya'),
            ),
          ],
        );
      },
    ) ?? false; // Default to false if dialog is dismissed
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0), // Rounded corners
        side: const BorderSide(color: Colors.black), // Black border
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Restaurant Image
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // Rounded image corners
              child: Image.asset(
                widget.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10), // Space between image and text
            // Restaurant Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.restaurantName,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${widget.distance} km away',
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            // Favorite Icon (Heart)
            IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ),
              onPressed: _toggleFavorite, // Toggle favorite status
            ),
          ],
        ),
      ),
    );
  }
}
