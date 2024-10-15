import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'App bar',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App bar',
      debugShowCheckedModeBanner: true,
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
            padding: EdgeInsets.zero, // Removes default padding
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 0, 100, 181),
                ),
                child: Text(
                  'Functions',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.map, color: Colors.white),
                title: const Text('Map', style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MapPage()),
                  );
                },
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
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title:
                    const Text('Logout', style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle logout action
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black12,
        body: const Align(
          alignment: Alignment.center,
          child: Text(
            'Welcome to your College Companion!',
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  const MapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 112, 198),
      ),
      backgroundColor: const Color.fromARGB(31, 66, 63, 63),
      body: const Center(
        child: Text('Place holder.',
            style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}

class EventsPage extends StatelessWidget {
  const EventsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 112, 198),
      ),
      backgroundColor: const Color.fromARGB(31, 66, 63, 63),
      body: const Center(
        child: Text('Place holder.',
            style: TextStyle(fontSize: 30, color: Colors.white)),
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Define the number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 7, 112, 198),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Mess 1'),
              Tab(text: 'Mess 2'),
            ],
          ),
        ),
        backgroundColor: const Color.fromARGB(31, 66, 63, 63),
        body: const TabBarView(
          children: [
            Center(
                child: Text('Mess one.',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            Center(
                child: Text('Mess two.',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
