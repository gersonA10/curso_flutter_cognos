

import 'package:flutter/material.dart';

class MenuOption {
  final String title;
  final String route;
  final Widget screen;
  final IconData icon;
  

  MenuOption({
    required this.route,
    required this.screen,
    required this.icon,
    required this.title
  });
}
