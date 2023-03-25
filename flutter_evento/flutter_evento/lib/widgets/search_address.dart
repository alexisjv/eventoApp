import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

typedef LocationCallback = void Function(List<double> latLng);

class SearchAddress extends StatefulWidget {
  final LocationCallback onLocationSelected;
  const SearchAddress({super.key, required this.onLocationSelected});
  @override
  EventoFormState createState() {
    return EventoFormState();
  }
}

class EventoFormState extends State<SearchAddress> {
  final TextEditingController _controller = TextEditingController();
  var uuid = Uuid();
  String _sessionToken = "1234";
  List<dynamic> _placesList = [];

  @override
  void initState() {
    // TODO: implement initState
    _controller.addListener(() {
      onChange();
    });
  }

  void onChange() {
    if (_sessionToken == null) {
      setState(() {
        _sessionToken = uuid.v4();
      });
    }

    getSuggesion(_controller.text);
  }

  void getSuggesion(String input) async {
    String kPLACES_API_KEY = 'AIzaSyALmmDJaBTq1yQKxPVwZE359skx6ricbFA';
    String baseURL =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json';
    String request =
        '$baseURL?input=$input&key=$kPLACES_API_KEY&sessiontoken=$_sessionToken';
    var response = await http.get(Uri.parse(request));
    var data = response.body.toString();
    if (response.statusCode == 200) {
      setState(() {
        _placesList = jsonDecode(response.body.toString())['predictions'];
      });
    } else {
      throw Exception('Error al cargar los datos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar evento'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(hintText: "Buscar dirección:"),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: _placesList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () async {
                          List<Location> locations = await locationFromAddress(
                              _placesList[index]['description']);

                          final Location location = Location(
                              latitude: locations.last.latitude,
                              longitude: locations.last.longitude,
                              timestamp: DateTime.now());

                          print(locations.last.latitude);
                          print(locations.last.longitude);
                          if (widget.onLocationSelected != null) {
                            widget.onLocationSelected([
                              locations.last.latitude,
                              locations.last.longitude
                            ]);
                          }
                        },
                        title: Text(_placesList[index]['description']),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
