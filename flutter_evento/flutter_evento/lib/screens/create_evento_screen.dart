import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_evento/widgets/search_address.dart';
import 'package:image_picker/image_picker.dart';
import '../models/evento.dart';
import '../services/evento_service.dart';

class CreateEventoScreen extends StatefulWidget {
  const CreateEventoScreen({super.key});

  @override
  EventoFormState createState() {
    return EventoFormState();
  }
}

class EventoFormState extends State<CreateEventoScreen> {
  final _formKey = GlobalKey<FormState>();
  String? adress;

  late File image;
  Evento evento = Evento(id: 0, name: "", coverImage: "", lat: 0.0, lng: 0.0);
  void handleLocationSelected(List<double> latLng) {
    evento.lat = latLng[0];
    evento.lng = latLng[1];
  }

  @override
  Widget build(BuildContext context) {
    final eventoService = EventoService();

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar evento'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  initialValue: evento.name,
                  decoration: InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un nombre';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    evento.name = value!;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (_) => SearchAddress(
                          onLocationSelected: handleLocationSelected),
                    );
                  },
                  child: Text('Buscar dirección'),
                ),
                const SizedBox(height: 16.0),
                const SizedBox(height: 16.0),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () async {
                    final imagePicker = ImagePicker();
                    final pickedFile = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                    );
                    if (pickedFile != null) {
                      setState(() {
                        image = File(pickedFile.path);
                      });
                    }
                  },
                  child: Text('Seleccionar imagen'),
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    final eventoService = EventoService();
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      eventoService.createEvento(evento, image);
                      print(evento.lat);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text('Guardar cambios'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
