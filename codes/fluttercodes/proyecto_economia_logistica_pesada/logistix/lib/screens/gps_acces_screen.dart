import '../blocs/gps/gps_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GpsAccesScreen extends StatelessWidget {
  const GpsAccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          return !state.isGpsEnabled
          ? const _EnableGpsMessage()
          : const _AccesButton();
        },
      )
    );
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('Es necesario el acceso a GPS'),
          ),
          MaterialButton(
            color: Colors.black,
            onPressed: () {
              //asi accedemos a la logica del blocGpd
              final gpsBloc = BlocProvider.of<GpsBloc>(context);
              gpsBloc.askGpsAcces();
            },
            elevation: 2,
            splashColor: Colors.transparent,
            child: Text(
              'Solicitar acceso',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            shape: const StadiumBorder(),
          )
        ],
      ),
    );
  }
}

class _EnableGpsMessage extends StatelessWidget {
  const _EnableGpsMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Debe habilitar el GPS"),
    );
  }
}
