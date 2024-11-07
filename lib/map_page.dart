import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

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
                    // Handle onTap for each utility item
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
