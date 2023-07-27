import 'dart:ui';
import 'package:flutter/material.dart';
import '../blocs/location/location_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistix/blocs/map/map_bloc.dart';




class BtnCurrentLocation extends StatelessWidget {
  const BtnCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final locationBloc= BlocProvider.of<LocationBloc>(context);
    final mapBloc= BlocProvider.of<MapBloc>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(Icons.my_location_outlined,color: Colors.black,),
          onPressed: () {
            //todo llamar el bloc 
            final userLocation= locationBloc.state.lastKnownLocation;
            if(userLocation==null) return; 
          mapBloc.moveCamera(userLocation);
          

          },
        ),
      ),
    );
  }
}
