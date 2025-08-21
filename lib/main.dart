import 'package:flutter/material.dart';
import 'package:project/editp.dart';
import 'package:project/login.dart';
import 'package:project/profile.dart';
// import 'package:my_application_1/screens/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // home: Profile(),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const Profile(),
        '/editp': (context) => const EditProfile(),
      },
    );
  }
}
