import 'package:flutter/material.dart';
import 'package:leaf_guard/screens/account_form_page.dart';
import 'package:leaf_guard/screens/home_screen.dart';
import 'package:leaf_guard/screens/ai_search_page.dart';
import 'package:leaf_guard/screens/contact_page.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const AISearchPage(), // ✅ Replaced with working AI search page
    const AccountFormPage(),
    const ContactPage(),
  ];

  void _onTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTapped,
          selectedItemColor: Colors.green[800],
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
            BottomNavigationBarItem(icon: Icon(Icons.contact_page), label: 'Contact'),
          ],
        ),
      ),
    );
  }
}
