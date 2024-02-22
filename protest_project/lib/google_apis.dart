import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps Example'),
        ),
        body: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(37.42796133580664, -122.085749655962),
            zoom: 14.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId('marker_1'),
              position: LatLng(37.42796133580664, -122.085749655962),
              infoWindow: InfoWindow(
                title: 'Googleplex',
                snippet: 'Google Headquarters',
              ),
            ),
          },
        ),
      ),
    );
  }
}