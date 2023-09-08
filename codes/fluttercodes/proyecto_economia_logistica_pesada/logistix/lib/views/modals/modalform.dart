import 'package:flutter/material.dart';

//este es registro de cargas
class FormTransportModel {
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
                        "Registro de carga",
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
                        '''Registre los detalles de su carga
                      ''',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Tipo de carga',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Divider(),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Dimensiones de la carga',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                          
                              width: 3,
                              color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Divider(),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Peso',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Divider(),
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Requisitos especiales',
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: Colors.black), //<-- SEE HERE
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '''Envia tu ubicacion para mas precisión
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
                          height: 50,
                          width: 250,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  " Enviar mi ubicacion",
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.location_on_outlined)
                              ],
                            ),
                          ),
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
                          width: 140,
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
                                fontSize: 15,
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
