import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logistix/blocs/gps/gps_bloc.dart';
import 'package:logistix/blocs/map/map_bloc.dart';
import 'package:logistix/screens/loading_screen.dart';
import 'package:logistix/blocs/location/location_bloc.dart';
import 'package:logistix/views/welcomepage/welcomepage.dart';


void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GpsBloc()),
        BlocProvider(create: (context) => LocationBloc()),
        BlocProvider(create:(context)=> MapBloc(locationBloc: BlocProvider.of<LocationBloc>(context)))
      ],
      child: Logistix(),
    ),
  );
}

class Logistix extends StatelessWidget {
  const Logistix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home:WelcomePage());
  }
}
