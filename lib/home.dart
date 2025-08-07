import 'package:flutter/material.dart';
import 'package:project/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Kelas State yang menyimpan data dinamis untuk HomePage
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Variabel untuk menyimpan indeks tab yang aktif

  // Daftar widget halaman yang ditampilkan berdasarkan tab yang dipilih
  final List<Widget> _pages = const [
    Center(child: Text('Ini halaman Beranda')), // Index 0
    Center(child: Text('Ini halaman Bookmark')), // Index 1
    Center(child: Text('Ini halaman Cart')), // Index 2
    const Profile(), // Index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi Flutter'), // Judul di AppBar
      ),
      body:
          _pages[_selectedIndex], // Menampilkan halaman sesuai index yang dipilih
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(
          milliseconds: 300,
        ), // Animasi saat berpindah tab
        selectedIndex: _selectedIndex, // Menentukan tab yang aktif
        onDestinationSelected: (index) {
          // Saat salah satu tab dipilih
          setState(() {
            _selectedIndex = index; // Perbarui index dan render ulang halaman
          });
        },
        destinations: const [
          // Daftar item pada NavigationBar
          NavigationDestination(
            icon: Icon(Icons.home_outlined), // Icon default
            selectedIcon: Icon(Icons.home_rounded), // Icon saat aktif
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
