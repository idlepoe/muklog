import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'BMYEONSUNG',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          fontFamily: 'BMYEONSUNG',
        ),
        iconTheme: IconThemeData(color: Colors.black87),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: Colors.orangeAccent, // 원하는 색상
        strokeCap: StrokeCap.round,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFFFCC66),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          elevation: 0,
          textStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMYEONSUNG',
            color: Colors.brown.shade800,
          ),
          foregroundColor: Colors.brown.shade800,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black87,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      ),
      cardColor: const Color(0xFFFFF7E6),
      cardTheme: CardTheme(color: Color(0xFFFFF7E6)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: const Color(0xFFFFCC66),
        foregroundColor: Colors.brown.shade800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }
}
