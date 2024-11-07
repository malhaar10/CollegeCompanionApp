import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilities extends StatelessWidget {
  const Utilities({super.key});

  // Function to launch the Play Store link for Changepay
  void _launchPlayStore() async {
    final Uri url = Uri.parse(
        'https://play.google.com/store/apps/details?id=in.changepay.customerAndroidApp');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> utilityNames = [
      'Salon',
      'Changepay',
      'Stationary',
      'Pharmacy',
      'General\nStore',
      'Restaurant'
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilities'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 112, 198),
      ),
      backgroundColor: const Color.fromARGB(31, 66, 63, 63),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(10),
        children: List.generate(utilityNames.length, (index) {
          return GestureDetector(
            onTap: () {
              // Check if the tapped item is "Changepay"
              if (utilityNames[index] == 'Changepay') {
                _launchPlayStore();
              }
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
    );
  }
}
