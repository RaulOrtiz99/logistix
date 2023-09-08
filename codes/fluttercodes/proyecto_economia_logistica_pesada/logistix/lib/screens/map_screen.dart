import 'dart:collection';
import '../views/map_view.dart';
import '../blocs/map/map_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistix/widgets/btn_location.dart';
import 'package:logistix/widgets/btn_follow_user.dart';
import 'package:show_up_animation/show_up_animation.dart';
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
        builder: (context, locationState) {
          if (locationState.lastKnownLocation == null)
            // ignore: curly_braces_in_flow_control_structures
            return const Center(
              child: Text('Espere por favor...'),
            );

          return BlocBuilder<MapBloc, MapState>(
            builder: (context, mapState) {
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    SizedBox(
                    width: 300,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Contraseña',
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: Colors.black,
                          size: 30,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.white70,
                      ),
                    ),
                  ),
                    MapViews(
                      polylines: mapState.polylines.values.toSet(),
                      initialLocation: locationState.lastKnownLocation!,
                    )
                    //Todo: botones...
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BtnFollowUser(),
          BtnCurrentLocation(),
          ElevatedButton(onPressed: (){}, child: Text('Solicicar Viaje'))
        ],
      ),
    );
  }
}
