import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'location_data.dart'; // Import the location data library

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    // Get current position
    return await Geolocator.getCurrentPosition();
  }

  void _navigateToLocation(BuildContext context, String destination) async {
    try {
      Position position = await _determinePosition();

      // Retrieve latitude and longitude from the LocationData library
      List<double>? coords = LocationData.locations[destination];
      if (coords == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location not found')),
        );
        return;
      }

      String url =
          'https://www.google.com/maps/dir/?api=1&origin=${position.latitude},${position.longitude}&destination=${coords[0]},${coords[1]}&travelmode=driving';

      // Launch the URL
      await launchUrl(Uri.parse(url));
    } catch (e) {
      // Handle any errors that occur during URL launching
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open Google Maps: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> utilityNames = [
      'AB 1',
      'AB 2',
      'AB 3',
      'AB 4',
      'AB 5',
      'Central Library',
      'MArena',
      'HB 1',
      'HB 2',
      'HB 3',
      'HB 4',
      'T A Pai Convention Center',
      'Gate 1',
      'Gate 3'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 112, 198),
      ),
      backgroundColor: const Color.fromARGB(31, 66, 63, 63),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Navigate to?',
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: List.generate(utilityNames.length, (index) {
                return GestureDetector(
                  onTap: () {
                    _navigateToLocation(context, utilityNames[index]);
                  },
                  child: Container(
                    color: const Color.fromARGB(255, 51, 51, 51),
                    child: Center(
                      child: Text(
                        utilityNames[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
