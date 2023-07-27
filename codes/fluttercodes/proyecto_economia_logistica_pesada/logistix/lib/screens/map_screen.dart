import 'dart:collection';
import '../views/map_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistix/widgets/btn_location.dart';
import 'package:logistix/blocs/location/location_bloc.dart';


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
    return Scaffold(
      body: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          if (state.lastKnownLocation == null)
            // ignore: curly_braces_in_flow_control_structures
            return const Center(
              child: Text('Espere por favor...'),
            );

          return SingleChildScrollView(
            child: Stack(
              children: [
                MapViews(
                  initialLocation: state.lastKnownLocation!,
                )
                //Todo: botones...
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        BtnCurrentLocation()
        ],
      ),
    );
  }
}
