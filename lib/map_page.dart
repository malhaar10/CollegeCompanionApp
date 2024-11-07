import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';
import 'location_data.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  void _navigateToLocation(BuildContext context, String destination) async {
    try {
      Position position = await _determinePosition();

      List<double>? coords = LocationData.locations[destination];
      if (coords == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Location not found')),
        );
        return;
      }

      String url =
          'https://www.google.com/maps/dir/?api=1&origin=${position.latitude},${position.longitude}&destination=${coords[0]},${coords[1]}&travelmode=walking';

      await launchUrl(Uri.parse(url));
    } catch (e) {
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
      'AB 1\n(Unavailable)',
      'AB 2',
      'AB 3',
      'AB 4',
      'AB 5',
      'Central Library\n(Unavailable)',
      'MArena',
      'HB 1',
      'HB 2',
      'HB 3',
      'HB 4',
      'T A Pai Convention Center',
      'Gate 1',
      'Gate 2\n(Unavailable)',
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
              crossAxisCount: 3, // Set to 3 buttons per row
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10),
              children: List.generate(utilityNames.length, (index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(
                        255, 51, 51, 51), // Set background color
                    padding: const EdgeInsets.symmetric(
                        vertical: 12), // Adjust vertical padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15), // Set the radius for rounded edges
                    ),
                  ),
                  onPressed: () {
                    _navigateToLocation(context, utilityNames[index]);
                  },
                  child: Center(
                    child: Text(
                      utilityNames[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16, // Reduced font size for smaller buttons
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
