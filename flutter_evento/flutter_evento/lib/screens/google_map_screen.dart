import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/evento_service.dart';
import '../widgets/google_maps.dart';

class GoogleMapScreen extends StatelessWidget {
  const GoogleMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<EventoService>(
      builder: (context, providerData, _) => FutureBuilder(
        future: providerData.getPosition(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          List<double> latlng = snapshot.data;
          return GoogleMaps(
            lat: latlng[0],
            lng: latlng[1],
          );
        },
      ),
    );
  }
}
