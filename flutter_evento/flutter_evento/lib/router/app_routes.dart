import 'package:flutter_evento/models/models.dart';

import '../screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    MenuOption(
        route: 'home',
        name: 'Inicio',
        screen: const HomeScreen(),
        icon: Icons.home),
    MenuOption(
        route: 'card',
        name: 'Buscar eventos',
        screen: const CardScreen(),
        icon: Icons.search),
    MenuOption(
        route: 'listView1',
        name: 'Mis eventos',
        screen: const Listview1Screen(),
        icon: Icons.list),
    MenuOption(
        route: 'listView2',
        name: 'Eventos pendientes',
        screen: const Listview2Screen(),
        icon: Icons.more_time_sharp),
    MenuOption(
        route: 'alert',
        name: 'Acerca de',
        screen: const AlertScreen(),
        icon: Icons.add_alert_rounded)
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  /* static Map<String, Widget Function(BuildContext)> routes = {
    'home': (BuildContext context) => const HomeScreen(),
    'listView1': (BuildContext context) => const Listview1Screen(),
    'listView2': (BuildContext context) => const Listview2Screen(),
    'alert': (BuildContext context) => const AlertScreen(),
    'card': (BuildContext context) => const CardScreen(),
  }; */

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
