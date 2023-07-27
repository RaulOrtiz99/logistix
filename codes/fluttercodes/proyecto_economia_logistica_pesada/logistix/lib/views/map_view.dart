import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapViews extends StatelessWidget {
  final LatLng initialLocation;
  const MapViews({super.key, required this.initialLocation});

  @override
  Widget build(BuildContext context) {
    CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );
    final size= MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
      ),
    );
  }
}