import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

// Tema Principal
  static final ThemeData lightTheme = ThemeData.light().copyWith(
      primaryColor: primary,

      // Card
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),

      // AppBar
      appBarTheme:
          const AppBarTheme(color: primary, elevation: 0, centerTitle: true),

      // TextButtons
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),

      // FloatingActionButtons
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: primary, elevation: 5),

      // ElevatedButtons
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: AppTheme.primary,
              shape: const StadiumBorder(),
              elevation: 0)),

      // InputDecoration
      inputDecorationTheme: const InputDecorationTheme(
        floatingLabelStyle: TextStyle(color: primary),
      ));

// Tema Oscuro
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      scaffoldBackgroundColor: Colors.black);
}

//
