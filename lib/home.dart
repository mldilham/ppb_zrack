import 'package:flutter/material.dart';
import 'package:project/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// State yang menyimpan data dinamis untuk HomePage
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Index tab aktif

  // Halaman sesuai tab
  final List<Widget> _pages = const [
    Center(child: Text('Ini halaman Beranda')), // Index 0
    Center(child: Text('Ini halaman Bookmark')), // Index 1
    Center(child: Text('Ini halaman Cart')), // Index 2
    Profile(), // Index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Zrack Berkah'), centerTitle: true),
      body: _pages[_selectedIndex], // Tampilkan halaman sesuai index
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index; // Update tab aktif
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home_rounded),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border_outlined),
            selectedIcon: Icon(Icons.bookmark_rounded),
            label: 'Bookmarks',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_bag_outlined),
            selectedIcon: Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
