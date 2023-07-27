import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistix/blocs/location/location_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late LocationBloc locationBloc;

  @override
  void initState() {
    super.initState();

    locationBloc = BlocProvider.of<LocationBloc>(context);
    locationBloc.startFollowingUser();
  }

  @override
  void dispose() {
    locationBloc.stopFollowingUser();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<LocationBloc, LocationState>(
      builder: (context, state) {
        if (state.lastKnownLocation == null)
          // ignore: curly_braces_in_flow_control_structures
          return const Center(child: Text('Espere por favor...'));
        CameraPosition initialCameraPosition = CameraPosition(
            target: state.lastKnownLocation!, zoom: 15);
        return GoogleMap(
          initialCameraPosition: initialCameraPosition,
        );
      },
    ));
  }
}
