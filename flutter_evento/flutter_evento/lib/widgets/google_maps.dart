import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMaps extends StatelessWidget {
  final double lat;
  final double lng;
  const GoogleMaps({Key? key, required this.lat, required this.lng})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, lng),
          zoom: 12,
        ),
        markers: {
          Marker(
            markerId: const MarkerId('marker_1'),
            position: LatLng(lat, lng),
            // infoWindow: InfoWindow(title: 'San Francisco'),
          ),
          const Marker(
            markerId: MarkerId('marker_2'),
            position: LatLng(37.4219923, -122.014),
            // infoWindow: InfoWindow(title: 'San Francisco'),
          ),
          const Marker(
            markerId: MarkerId('marker_3'),
            position: LatLng(37.4219943, -122.044),
            // infoWindow: InfoWindow(title: 'San Francisco'),
          ),
          const Marker(
            markerId: MarkerId('marker_4'),
            position: LatLng(37.4219983, -122.054),
            // infoWindow: InfoWindow(title: 'San Francisco'),
          ),
        },
      ),
    );
  }
}
