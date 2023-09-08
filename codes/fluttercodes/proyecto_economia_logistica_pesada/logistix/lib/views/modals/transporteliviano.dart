import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:logistix/views/modals/modal_solicitar_servicio.dart';

class TransporteLivianoModal {
  Future? modalFormTransport(BuildContext context) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        builder: (context) {
          bool? _isChecked = false;
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    AppBar(
                      title: Text(
                        "Lista de conductores",
                        style: TextStyle(color: Colors.black),
                      ),
                      iconTheme: IconThemeData(color: Colors.black),
                      backgroundColor: Colors.white,
                      elevation: 0.1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '''Los precios van de acuerdo al peso de la carga
                      ''',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        SolicitarServicio servicio = SolicitarServicio();
                        Navigator.push(
                          context,
                          servicio.modalFormTransport(context)
                              as Route<Object?>,
                        );
                      },
                      child: GFListTile(
                          avatar: Image.asset(
                            'assets/images/conductor.png',
                            height: 50,
                          ),
                          titleText: 'Pedro Perez',
                          subTitleText: '10 viajes realizados con exito',
                          icon: Icon(Icons.arrow_forward_ios)),
                    ),
                    Divider(),
                    GFListTile(
                        avatar: Image.asset(
                          'assets/images/conductor.png',
                          height: 50,
                        ),
                        titleText: 'Luis Ramirez',
                        subTitleText: '20 viajes realizados con exito',
                        icon: Icon(Icons.arrow_forward_ios)),
                    Divider(),
                    GFListTile(
                        avatar: Image.asset(
                          'assets/images/conductor.png',
                          height: 50,
                        ),
                        titleText: 'Miguel Choque',
                        subTitleText: '5 viajes realizados con exito',
                        icon: Icon(Icons.arrow_forward_ios)),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '''Toma en cuenta que los precios van de acuerdo al peso de la carga
                      ''',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: TextButton(
                            child: Text(
                              "Cancelar",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 18),
                            ),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        SizedBox(
                          height: 50,
                          width: 150,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {
                              // CompletePayment().modalCompletePayment(context);
                            },
                            child: Text(
                              "Guardar",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
