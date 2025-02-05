import 'package:flutter/material.dart';

import 'homepage.dart';

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
            SizedBox(height: 20, width: screenWidth),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20, width: screenWidth),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
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
