import 'package:flutter/material.dart';
import 'package:logistix/screens/gps_acces_screen.dart';

void main() => runApp(const Logistix());

class Logistix extends StatelessWidget {
  const Logistix({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: GpsAccesScreen()
    );
  }
}