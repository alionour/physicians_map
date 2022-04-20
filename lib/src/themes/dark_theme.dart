import 'package:flutter/material.dart';

/// Represents the theme when the current used theme is in dark mode
class DarkTheme {
  static DarkTheme get instance => DarkTheme._darkTheme();
  // SINGLETON IN DART
  DarkTheme._darkTheme();

  ThemeData darkTheme() {
    return ThemeData(
        primaryColor: Colors.black,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black38,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.deepPurple,
          selectedItemColor: Colors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
        )
        // dialogTheme: const DialogTheme(
        //   backgroundColor: Colors.blueGrey,
        //   contentTextStyle: TextStyle(
        //     color: Colors.white,
        //   ),
        //   titleTextStyle:
        //       TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        // ),
        );
  }
}
