import 'package:flutter/material.dart';

/// Represents the theme when the current used theme is in dark mode
class LightTheme {
  static LightTheme get instance => LightTheme._lightTheme();
  // SINGLETON IN DART
  LightTheme._lightTheme();

  // SINGLETON IN DART USING FACTORY CONSTRUCTOR
  factory LightTheme() {
    return LightTheme._lightTheme();
  }

  ThemeData lightTheme() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
