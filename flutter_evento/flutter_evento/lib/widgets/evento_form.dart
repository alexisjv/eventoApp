import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_evento/widgets/search_address.dart';
import 'package:image_picker/image_picker.dart';
import '../models/evento.dart';
import '../services/evento_service.dart';
import 'package:latlong2/latlong.dart';

class EventoForm extends StatefulWidget {
  const EventoForm({super.key});

  @override
  EventoFormState createState() {
    return EventoFormState();
  }
}

class EventoFormState extends State<EventoForm> {
  final _formKey = GlobalKey<FormState>();
  String? _name;
  double? _lat;
  double? _lng;
  String? _coverImage;
  String? adress;
  TextEditingController _addressController = TextEditingController();
  List<String> _suggestions = [];
  List _searchResults = [];

  late File image;
  Evento evento = Evento(id: 0, name: "", coverImage: "", lat: 0.0, lng: 0.0);

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
                      builder: (_) => SearchAddress(),
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
