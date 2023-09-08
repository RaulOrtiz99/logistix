import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart'; 



class TransportePesadoModal {
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
                        "Conductores de transporte pesado",
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
                    GFListTile(
                        avatar: GFAvatar(),
                        titleText: 'Carga pesada',
                        subTitleText:
                            'Arriba de media tonelada el costo es 1000 bs',
                        icon: Icon(Icons.favorite)),
                    Divider(),
                    GFListTile(
                        avatar: GFAvatar(),
                        titleText: 'Carga mediana',
                        subTitleText:
                            'Arriba de media tonelada el costo es 1000 bs',
                        icon: Icon(Icons.favorite)),
                    Divider(),
                    GFListTile(
                        avatar: GFAvatar(),
                        titleText: 'Carga liviana',
                        subTitleText:
                            'Arriba de media tonelada el costo es 1000 bs',
                        icon: Icon(Icons.favorite)),
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