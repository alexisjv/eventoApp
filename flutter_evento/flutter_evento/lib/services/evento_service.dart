import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import '../models/evento.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class EventoService extends ChangeNotifier {
  List<Evento> listEventos = [];

  Future<void> createEvento(Evento eventoData, File file) async {
    final url = Uri.parse('http://192.168.0.18:8080/api/eventos/create');
    final request = http.MultipartRequest('POST', url);

    // Agregar los datos del evento al cuerpo de la petición
    request.fields['name'] = eventoData.name;
    request.fields['lat'] = eventoData.lat.toString();
    request.fields['lng'] = eventoData.lng.toString();

    // Crear un objeto MultipartFile a partir del archivo File
    final fileStream = http.ByteStream(Stream.castFrom(file.openRead()));
    final multipartFile = http.MultipartFile(
        'imageFile', fileStream, await file.length(),
        filename: path.basename(file.path));

    // Agregar el objeto MultipartFile al cuerpo de la petición
    request.files.add(multipartFile);

    final response = await request.send();

    if (response.statusCode == 200) {
      // Si el servidor responde con un código 200 (OK),
      // puedes procesar la respuesta aquí
    } else {
      // Si el servidor responde con un código distinto a 200,
      // debes manejar el error aquí
    }
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
}
