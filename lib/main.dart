import 'package:flutter/material.dart';
// HomePage
import 'package:assessment/beranda.dart';

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
