import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red, // 🔴 Red background
      appBar: AppBar(
        title: const Text('Leaf Guard Dashboard'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Leaf Guard!',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // 🔍 Search Page Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: const Icon(Icons.search),
              label: const Text('🔍 Go to Search Page'),
            ),

            const SizedBox(height: 10),

            // 📝 Account Form Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/account');
              },
              icon: const Icon(Icons.person_add),
              label: const Text('📝 Create Account'),
            ),

            const SizedBox(height: 10),

            // 📍 Contact Page Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/contact');
              },
              icon: const Icon(Icons.location_on),
              label: const Text('📍 Contact Page'),
            ),

            const SizedBox(height: 10),

            // 🧠 AI Plant Detector Button
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/ai');
              },
              icon: const Icon(Icons.psychology_alt),
              label: const Text('🧠 AI Plant Detector'),
            ),
          ],
        ),
      ),
    );
  }
}
