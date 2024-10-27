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
      home: LoginPage(),
    );
  }
}

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
            padding: EdgeInsets.zero, // Removes default padding
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
                    MaterialPageRoute(builder: (context) => const MapPage()),
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

class Utilities extends StatelessWidget {
  const Utilities({super.key});

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
    final List<Color> uColors = [
      Colors.grey,
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
          crossAxisSpacing: 10, // Space between columns
          mainAxisSpacing: 10, // Space between rows
          padding: const EdgeInsets.all(10), // Outer padding for the grid
          children: List.generate(6, (index) {
            return Container(
              color: const Color.fromARGB(255, 51, 51,
                  51), // Set the same background color for all items
              child: Center(
                child: Text(
                  utilityNames[index],
                  textAlign: TextAlign.center, // Center align text
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            );
          }),
        ));
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

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * 0.7;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login',
              style: TextStyle(
                  color: Color.fromARGB(255, 65, 65, 65), fontSize: 20)),
          backgroundColor: Colors.blue,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: const Color.fromARGB(255, 51, 51, 51),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Login Page',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(
                height: 20, width: screenWidth), // Add spacing between elements
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
                height: 20, width: screenWidth), // Add spacing between elements
            const TextField(
              obscureText: true, // Mask the input for password
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30), // Add some more space
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const HomePage()),
                // );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Set the button color
              ),
              child: const Text('Login', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 7),
            const Text('or',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            const SizedBox(height: 7),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: const Text(
                'Continue without signing in',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blueAccent),
              ),
            ),
          ],
        )));
  }
}
