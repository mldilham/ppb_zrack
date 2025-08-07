import 'package:flutter/material.dart';
import 'package:project/login.dart';
// import 'package:my_application_1/screens/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter', // Judul aplikasi (muncul di task switcher)
      theme: ThemeData(
        // Mengatur tema aplikasi
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ), // Skema warna utama
      ),
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug di pojok kanan atas
      home: LoginPage(), // Menentukan halaman pertama yang muncul saat aplikasi dibuka
    );
  }
}
