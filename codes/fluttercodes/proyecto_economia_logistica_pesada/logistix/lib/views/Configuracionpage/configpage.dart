import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({super.key});

  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        
        children: [
          Image.asset('assets/images/profileimage.png'),
          GFListTile(
            titleText: 'Nombre',
            subTitleText: 'Gustavo Alfredo',
            icon: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          GFListTile(
            titleText: 'Apelido',
            subTitleText: 'Suarez Arteaga',
            icon: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          GFListTile(
            titleText: 'Correo',
            subTitleText: 'gustavosuarez@gmail.com',
            icon: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          GFListTile(
            titleText: 'Contraseña',
            subTitleText: '**********',
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
