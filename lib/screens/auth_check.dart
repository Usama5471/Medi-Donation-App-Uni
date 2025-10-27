import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leaf_guard/screens/main_page.dart'; // Bottom Navigation
import 'package:leaf_guard/screens/account_form_page.dart'; // Sign in / Signup page

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(), // 🔁 Listen to auth state
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // ⏳ Show splash/loader
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          // 🔐 User is logged in
          return const MainPage();
        } else {
          // 🚪 Not logged in
          return const AccountFormPage();
        }
      },
    );
  }
}
