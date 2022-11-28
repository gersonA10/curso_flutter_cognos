import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Colors.indigo;

  static final ThemeData themeDataLight = ThemeData.light().copyWith(
    primaryColor: Colors.indigo,

    // APPBAR THEME
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.indigo,
      elevation: 0,
    ),

    // LISTTILE THEME
    listTileTheme: const ListTileThemeData(
      iconColor: Colors.indigo,
    ),

    //ELECATED BUTTON THEME
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: const StadiumBorder(),
      ),
    ),
    //INPUT DECORATION THEME
    inputDecorationTheme: InputDecorationTheme(

        //Cuando seleccionemos el Input
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: primary,
          ),
        ),
        //Cuando este habilitado el Input
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),

        /*
        Borde en general
        A todos los input que esten habilitados
        */
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        prefixIconColor: primary
        //borde
        ),

    //FLOATING ACTION BUTTON
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primary,
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
