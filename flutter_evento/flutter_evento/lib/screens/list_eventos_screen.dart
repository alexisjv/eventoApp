import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/evento.dart';
import '../services/evento_service.dart';
import '../widgets/custom_card_image.dart';

class ListEventosScreen extends StatelessWidget {
  const ListEventosScreen({Key? key}) : super(key: key);

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
          return ListEventos(listEventos = listEventos);
        },
      ),
    );
  }
}

class ListEventos extends StatelessWidget {
  List<Evento> listEventos = [];

  ListEventos(this.listEventos, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Eventos'),
        ),
        body: Column(
          children: [
            /* const CustomCard(),
            const SizedBox(
              height: 10,
            ), */
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
