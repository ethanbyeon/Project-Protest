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
class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  // GoogleMapController _controller;
  List<String> _locations = List.generate(50, (index) => 'Location $index');
  String protest_information = "Select a protest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map with ListView'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Row(
            children: [
              Expanded(
                flex: 3,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(37.7749, -122.4194), // San Francisco Coordinates
                    zoom: 10,
                  ),
                  // onMapCreated: (controller) {
                  //   setState(() {
                  //     _controller = controller;
                  //   });
                  //},
                ),
              ), // Removed the extra comma here
              Expanded(
                flex: 2,
                child: Text(
                  protest_information,
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
            ],
          ),
          ),
          Expanded(
            flex: 2,
            child: ListView.builder(
              itemCount: _locations.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_locations[index]),
                  onTap: () {
                    setState(() {
                      protest_information = "New Information";
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}