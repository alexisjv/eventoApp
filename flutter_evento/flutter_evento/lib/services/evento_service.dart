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

  Future getPosition() async {
    double lat;
    double lng;
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lat = position.latitude;
    lng = position.longitude;
    return [lat, lng];
  }
}
