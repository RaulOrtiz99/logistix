import 'dart:ui';
import 'package:flutter/material.dart';
import '../blocs/location/location_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistix/ui/custom_snackbar.dart';
import 'package:logistix/blocs/map/map_bloc.dart';

class BtnFollowUser extends StatelessWidget {
  const BtnFollowUser({super.key});

  @override
  Widget build(BuildContext context) {
    final mapBloc = BlocProvider.of<MapBloc>(context);
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: BlocBuilder<MapBloc, MapState>(
          builder: (context, state) {
            return IconButton(
              icon: Icon(
                state.isFollowingUser?
                Icons.directions_run_rounded:Icons.hail_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                //todo llamar el bloc
                mapBloc.add(OnStartFollowingUserEvent());
                
              },
            );
          },
        ),
      ),
    );
  }
}
