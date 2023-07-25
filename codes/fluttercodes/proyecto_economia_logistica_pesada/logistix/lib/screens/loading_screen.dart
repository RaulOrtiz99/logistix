import 'package:flutter/material.dart';
import 'package:logistix/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistix/screens/map_screen.dart';
import 'package:logistix/screens/gps_acces_screen.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: BlocBuilder<GpsBloc,GpsState>(
          builder: (context,state) {
            return state.isAllGranted
            ?const MapScreen()
            : const GpsAccesScreen();
          },
        )
      ),
    );
  }
}