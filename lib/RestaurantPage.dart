import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurants'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 112, 198),
      ),
      backgroundColor:
          const Color.fromARGB(255, 51, 51, 51), // Set background color
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          _buildImageTile(
              context, 'assets/images/menu1.jpg', 'Menu 1', 'Desi Deli menu 1'),
          _buildImageTile(
              context, 'assets/images/menu2.jpg', 'Menu 2', 'Desi Deli menu 2'),
          _buildImageTile(context, 'assets/images/menu3.jpg', 'Menu 3',
              'Snack Adda menu 1'),
          _buildImageTile(
              context, 'assets/images/menu4.jpg', 'Menu 4', 'Snack Adda menu'),
        ],
      ),
    );
  }

  Widget _buildImageTile(BuildContext context, String imagePath, String title,
      String description) {
    return GestureDetector(
      onTap: () {
        // Open the image in a popup view when tapped
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhotoView(
              imageProvider: AssetImage(imagePath),
              heroAttributes: PhotoViewHeroAttributes(
                  tag: title), // Optional hero animation
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10), // Round corners of image
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 200,
            ),
          ),
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(color: Colors.white, fontSize: 18)),
          Text(description, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
