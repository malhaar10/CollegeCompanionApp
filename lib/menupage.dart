import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 7, 112, 198),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Bluedove'),
              Tab(text: "Chef's touch"),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
          ),
        ),
        backgroundColor: const Color.fromARGB(31, 66, 63, 63),
        body: const TabBarView(
          children: [
            Center(
                child: Text('BlueDove menu.',
                    style: TextStyle(color: Colors.white, fontSize: 20))),
            Center(
                child: Text("Chef's Touch menu.",
                    style: TextStyle(color: Colors.white, fontSize: 20))),
          ],
        ),
      ),
    );
  }
}
