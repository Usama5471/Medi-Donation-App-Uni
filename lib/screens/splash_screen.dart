import 'package:flutter/material.dart';
import 'dart:async';
import 'dashboard.dart'; // Your main screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Dashboard()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4CAF50), // Green or use brown
      body: Center(
        child: Image.asset(
          'assets/images/leaf_guard_logo.jpeg',
          width: 150,
        ),
      ),
    );
  }
}
