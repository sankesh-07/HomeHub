import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

void main() {
  runApp(RealEstateApp());
}

class RealEstateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Real Estate App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF35D0F2),
        hintColor: Color(0xFF1DF2F2),
        scaffoldBackgroundColor: Color(0xFFF2F2F2),
        appBarTheme: AppBarTheme(
          color: Color(0xFF025951),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: Color(0xFF35D0F2),
          unselectedItemColor: Color(0xFF0D0D0D),
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF0D0D0D)),
          bodyMedium: TextStyle(color: Color(0xFF0A4036)),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
