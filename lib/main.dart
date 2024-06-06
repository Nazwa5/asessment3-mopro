import 'package:flutter/material.dart';
// HomePage
import 'package:assessment/beranda.dart';
// Register
import 'package:assessment/Register/Register.dart';
// Login
import 'package:assessment/login/login.dart';
// Home Menu
import 'package:assessment/MainPage/Home.dart';
import 'package:assessment/MainPage/Home2.dart';
// Maps
import 'package:assessment/Maps/Maps.dart';
import 'package:assessment/Maps/Rute.dart';
// Profile
import 'package:assessment/profile/profile.dart';
// Search
import 'package:assessment/search/search.dart';
import 'package:assessment/search/desc.dart';
// Destinasi
import 'package:assessment/destinasi/destinasi.dart';

void main() {
  runApp(const MyApp());
}

class AppTheme {
  static ThemeData get themeData {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color(0xFFD8D7FE),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(Colors.transparent),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      // home: const DetailScreen(),
      home: const HomePage(),
    );
  }
}
