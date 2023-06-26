import 'package:flutter/material.dart';

class GpsAccesScreen extends StatelessWidget {
  const GpsAccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: _AccesButton());
  }
}

class _AccesButton extends StatelessWidget {
  const _AccesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text('Es necesario el acceso a GPS'),
        ),
        MaterialButton(
          color: Colors.black,
          onPressed: () {},
          elevation: 2,
          splashColor: Colors.transparent,
          child: Text('Solicitar acceso',style: TextStyle(color: Colors.white,),),
          shape: const StadiumBorder(),
        )
      ],
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
