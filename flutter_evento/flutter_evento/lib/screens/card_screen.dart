import 'package:flutter/material.dart';
import 'package:flutter_evento/widgets/widgets.dart';
import '../models/evento.dart';

class CardScreen extends StatelessWidget {
  List<Evento> listEventos = [];

  CardScreen(this.listEventos, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Eventos'),
        ),
        body: Column(
          children: [
            const CustomCard(),
            const SizedBox(
              height: 10,
            ),
            if (listEventos.isEmpty)
              const Text('No hay eventos disponibles')
            else
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      itemCount: listEventos.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomCardImage(
                            imageUrl:
                                "http://192.168.0.18:8080/api/eventos/loadImage/${listEventos[index].coverImage}",
                            icon: const Icon(Icons.abc),
                            title: listEventos[index].name);
                      })),
          ],
        ));
  }
}
