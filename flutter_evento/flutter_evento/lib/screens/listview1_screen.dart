import 'package:flutter/material.dart';
import 'package:flutter_evento/themes/app_theme.dart';

class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = ["Favoritos", "Próximos", "Anteriores"];
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListView 1"),
        ),
        body: ListView(
          children: [
            ...options
                .map((option) => ListTile(
                      title: Text(option),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        color: AppTheme.primary,
                      ),
                    ))
                .toList()
          ],
        ));
  }
}
