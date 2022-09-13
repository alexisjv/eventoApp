import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_evento/themes/app_theme.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);

  void displayDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(15)),
            elevation: 5,
            title: const Text(
              'Creado por Alexis con Flutter',
              textAlign: TextAlign.center,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FlutterLogo(
                  size: 100,
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/fondo.jpg'),
              fit: BoxFit.cover,
            )),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Center(
                child: ElevatedButton(
                  // style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Acerca de',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onPressed: () => displayDialog(context),
                ),
              ),
            )),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.close),
            onPressed: () {
              // volvemos a la pantalla anterior
              Navigator.pop(context);
            }));
  }
}
