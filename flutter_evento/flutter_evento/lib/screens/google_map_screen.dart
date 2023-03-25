import 'package:flutter/material.dart';
import 'package:flutter_evento/screens/filter_screen.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import '../services/evento_service.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const FilterScreen()),
          );
        },
        child: const Icon(Icons.search),
      ),
      appBar: AppBar(
        title: const Text('Buscar Evento'),
      ),
      body: Consumer<EventoService>(
        builder: (context, providerData, _) => FutureBuilder(
          future: providerData.getPosition(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            List<double> latlng = snapshot.data;

            return FlutterMap(
              options: MapOptions(
                center: LatLng(latlng[0], latlng[1]), // Centro de Nueva York
                zoom: 13.0,
                maxZoom: 16.0,
                plugins: [MarkerClusterPlugin()],
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate:
                      'https://server.arcgisonline.com/ArcGIS/rest/services/Canvas/World_Light_Gray_Base/MapServer/tile/{z}/{y}/{x}',
                  subdomains: ['a', 'b', 'c'],
                  tileProvider: const NonCachingNetworkTileProvider(),
                ),
                MarkerLayerOptions(
                  markers: [
                    Marker(
                      width: 40.0,
                      height: 40.0,
                      point: LatLng(latlng[0], latlng[1]),
                      builder: (context) => const Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
