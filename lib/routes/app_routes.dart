import 'package:components_app/models/menu_option.dart';
import 'package:components_app/screens/alert_screen.dart';
import 'package:components_app/screens/animated_screen.dart';
import 'package:components_app/screens/card_screen.dart';
import 'package:components_app/screens/listview_builder.dart';
import 'package:components_app/screens/screens.dart';
import 'package:components_app/screens/slider_screen.dart';
import 'package:components_app/screens/texts_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'home',
        screen: const HomeScreen(),
        icon: Icons.home,
        title: 'Inicio'),
    MenuOption(
        route: 'list1',
        screen: const ListViewScreen(),
        icon: Icons.list,
        title: 'Lista simple'),
    MenuOption(
      route: 'list2',
      screen: const ListView2Screen(),
      icon: Icons.list_alt,
      title: 'Lista con builder',
    ),
    MenuOption(
      route: 'avatar',
      screen: const AvatarScreen(),
      icon: Icons.person,
      title: 'Avatar',
    ),
    MenuOption(
      route: 'card',
      screen: const CardScreen(),
      icon: Icons.credit_card,
      title: 'Card',
    ),
    MenuOption(
      route: 'alert',
      screen: const AlertScreen(),
      icon: Icons.add_alert_sharp,
      title: 'Alert',
    ),
    MenuOption(
      route: 'text',
      screen: TextScreen(),
      icon: Icons.text_fields_sharp,
      title: 'Text',
    ),
    MenuOption(
      route: 'animated',
      screen: const AnimatedScreen(),
      icon: Icons.play_circle_outline_sharp,
      title: 'Animated Container',
    ),
    MenuOption(
      route: 'slider',
      screen: const SliderScreen(),
      icon: Icons.slideshow_outlined,
      title: 'Silder',
    ),
    MenuOption(
      route: 'listViewBuilder',
      screen: const ListViewBuilderPage(),
      icon: Icons.line_style_rounded,
      title: 'ListViewBuilder',
    ),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const AlertaScreen(),
    );
  }
}
