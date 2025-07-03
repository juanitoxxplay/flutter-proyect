import 'package:flutter/material.dart';

class FordTheme {
  static const Color fordBlue = Color(0xFF003478);
  static const Color lapisBlue = Color(0xFF2A6BAC);
  static const Color lightBlue = Color(0xFF47A8E5);
  static const Color silver = Color(0xFFC6C6C6);
  static const Color white = Colors.white;

  static ThemeData lightTheme = ThemeData(
    primaryColor: fordBlue,
    scaffoldBackgroundColor: white,
    appBarTheme: const AppBarTheme(
      backgroundColor: fordBlue,
      foregroundColor: white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: fordBlue,
      foregroundColor: white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: lapisBlue),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: fordBlue),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(fordBlue),
      trackColor: MaterialStateProperty.all(silver),
    ),
  );
}
