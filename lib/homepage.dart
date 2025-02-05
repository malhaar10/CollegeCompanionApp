import 'package:flutter/material.dart';

import 'eventspage.dart';
import 'login.dart';
import 'map_page.dart';
import 'menupage.dart';
import 'utilitiespage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App bar',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'College Companion',
            style:
                TextStyle(fontSize: 25, color: Color.fromARGB(255, 22, 24, 24)),
          ),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 7, 112, 198),
        ),
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 73, 73, 73),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 100, 181),
                ),
                child: Text(
                  'Functions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.map, color: Colors.white),
                title: const Text('Map', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapPage()),
                  );
                },
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              ListTile(
                leading: const Icon(Icons.lightbulb, color: Colors.white),
                title: const Text('Utilities',
                    style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Utilities()),
                  );
                },
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today, color: Colors.white),
                title:
                    const Text('Events', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EventsPage()),
                  );
                },
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              ListTile(
                leading: const Icon(Icons.local_dining, color: Colors.white),
                title:
                    const Text('Menu', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MenuPage()),
                  );
                },
              ),
              const Divider(
                height: 10,
                thickness: 1,
                indent: 10,
                endIndent: 10,
                color: Colors.white,
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black12,
        body: const Align(
          alignment: Alignment.center,
          child: Text(
            'Welcome to the College Companion!\n This app will help you navigate throught the campus and much more!\nAB -> Academic Block\nHB -> Hostel Block',
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
