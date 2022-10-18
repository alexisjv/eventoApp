import 'package:flutter_evento/models/models.dart';

import '../screens/screens.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
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
        icon: Icons.add_alert_rounded),
    MenuOption(
        route: 'profile',
        name: 'Mi perfil',
        screen: const AvatarScreen(),
        icon: Icons.person),
    MenuOption(
        route: 'animated',
        name: 'Animación',
        screen: const AnimatedScreen(),
        icon: Icons.play_circle),
    MenuOption(
        route: 'inputs',
        name: 'Inputs',
        screen: const InputsScreen(),
        icon: Icons.input_outlined)
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => HomeScreen()});

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }

    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  }
}
