import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData themeDataLight = ThemeData.light().copyWith(
    primaryColor: Colors.deepPurple,

    // APPBAR THEME
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      elevation: 0,
    ),

    // LISTTILE THEME
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.deepPurple,
    ),

    //ELECATED BUTTON THEME
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        shape: StadiumBorder(),
      ),
    ),

    //FLOATING ACTION BUTTON
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppTheme.primary,
    ),
  );

  static final ThemeData themeDataDark = ThemeData.dark().copyWith(
    primaryColor: Colors.black,

    // APPBAR THEME
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.red,
      elevation: 0,
    ),

    // LISTTILE THEME
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.red,
    ),
  );
}
