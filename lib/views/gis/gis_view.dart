import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_pdam/views/gis/gis_presenter.dart';
import 'package:one_context/one_context.dart';

class GisView extends StatefulWidget {
  @override
  _GisViewState createState() => _GisViewState();
}

class _GisViewState extends State<GisView> {
  GoogleMapController controller;
  static const LatLng _center = const LatLng(0.000000, 109.333336);
  LatLng lastMapPosition = _center;
  MapType _currentMapType = MapType.normal;

  void _onMapCreate(GoogleMapController controller) {
    this.controller = controller;
  }

  _onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(
            "",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        body: Stack(
          children: [
            GoogleMap(
              onMapCreated: _onMapCreate,
              initialCameraPosition:
                  CameraPosition(target: _center, zoom: 20.0),
              mapType: _currentMapType,
              onCameraMove: _onCameraMove,
              zoomControlsEnabled: false,
            ),
            FloatingActionButton(onPressed: () {
              displayBottomSheet();
            }),
          ],
        ),
      ),
    );
  }
}
