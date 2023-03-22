import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/evento.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class EventoService extends ChangeNotifier {
  List<Evento> listEventos = [];

  EventoService() {
    getEventos();
  }

  Future<List<Evento>> getEventos() async {
    final url = Uri.parse('http://192.168.0.18:8080/api/eventos/getAll');
    var response = await http.get(url);
    List<Evento> eventos;
    eventos = (json.decode(response.body) as List)
        .map((i) => Evento.fromJson(i))
        .toList();
    listEventos = eventos;
    return listEventos;
  }

  Future<List<double>> getPosition() async {
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    return [position.latitude, position.longitude];
  }

  /*  Future<List<LatLng>> getNearEventos() async {
    List<double> position = getPosition();
    List<LatLng> locations = [
      LatLng(37.7749, -122.4194),
      LatLng(37.7858, -122.4064),
      LatLng(37.7775, -122.4162),
      LatLng(37.7767, -122.3942),
      LatLng(37.7949, -122.4084),
    ];
    final Distance distance = Distance();
    final LatLng currentPosition = LatLng(position[0], position[1]); // Ubicación actual
    List<LatLng> filteredLocations = locations
        .where((location) =>
            distance.as(
              LengthUnit.Kilometer,
              currentPosition,
              location,
            ) <=
            2)
        .toList();
    return filteredLocations;
  } */
}
