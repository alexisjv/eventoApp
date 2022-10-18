import 'package:flutter/material.dart';
import 'package:flutter_evento/router/app_routes.dart';
import 'package:flutter_evento/screens/inputs_screen.dart';
import 'package:flutter_evento/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Secciones'),
        ),
        body: ListView.separated(
          itemCount: menuOptions.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(menuOptions[index].name),
            leading: Icon(menuOptions[index].icon, color: AppTheme.primary),
            onTap: () {
              /* final route = MaterialPageRoute(
                builder: (context) => const Listview2Screen());

            Navigator.push(context, route); */

              Navigator.pushNamed(context, menuOptions[index].route);
            },
          ),
          separatorBuilder: (_, __) => const Divider(),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InputsScreen()));
            }));
  }
}
