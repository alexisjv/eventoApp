import 'package:flutter/material.dart';

class Evento extends ChangeNotifier {
  int id;
  String name;
  double lat;
  double lng;
  String coverImage;

  Evento({
    required this.id,
    required this.name,
    required this.coverImage,
    required this.lat,
    required this.lng,
  });

  Evento.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        lat = json['lat'],
        lng = json['lng'],
        coverImage = json['coverImage'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lat': lat,
        'lng': lng,
        'coverImage': coverImage,
      };

  // Método para actualizar la información del evento
  void updateEvento({
    required String newName,
    required double newLat,
    required double newLng,
    required String newCoverImage,
  }) {
    name = newName;
    lat = newLat;
    lng = newLng;
    coverImage = newCoverImage;

    // Notificar a los listeners que se ha producido un cambio en el evento
    notifyListeners();
  }
}
