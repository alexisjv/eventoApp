import 'package:flutter/material.dart';
import 'package:flutter_evento/screens/card_screen.dart';
import 'package:provider/provider.dart';
import '../models/evento.dart';
import '../services/evento_service.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventoService>(
      builder: (context, providerData, _) => FutureBuilder(
        future: providerData.getEventos(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Evento> listEventos = snapshot.data;
          return CardScreen(listEventos = listEventos);
        },
      ),
    );
  }
}
