import 'package:components_app/routes/app_routes.dart';
import 'package:components_app/routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Componentes App',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.deepPurple,

        // APPBAR THEME
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
        ),

        // LISTTILE THEME
        listTileTheme: const ListTileThemeData(iconColor: Colors.deepPurple),
      ),
    );
  }
}
