import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistix/blocs/map/map_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapViews extends StatelessWidget {
  final Set<Polyline> polylines;
  final LatLng initialLocation;
  const MapViews({super.key, required this.initialLocation, required this.polylines});

  @override
  Widget build(BuildContext context) {
    
    final mapBloc = BlocProvider.of<MapBloc>(context);
    CameraPosition initialCameraPosition = CameraPosition(
      target: initialLocation,
      zoom: 15,
    );
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Listener(
        onPointerMove: (pointerMoveEvent)=>mapBloc.add(OnStopFollowingUserEvent()),
        child: GoogleMap(
            initialCameraPosition: initialCameraPosition,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            polylines:polylines,
            onMapCreated: (controller) =>
                mapBloc.add(OnMapInitializedEvent(controller))
            //todo: MARKERS
            //TODO: POLYLINES
            //TODO: CUANDO SE MUEVA EL MAPA
            ),
      ),
    );
  }
}
