import '../modals/modalform.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:logistix/views/modals/cotizacionmodal.dart';
import 'package:logistix/views/modals/transportepesado.dart';
import 'package:logistix/views/modals/transporteliviano.dart';
import 'package:logistix/views/modals/transportemediano.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 1,
        title: Text('Inicio'),
      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Text('Servicios',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          GFCarousel(height: 250, items: [
            SizedBox(
              height: 200,
              child: GestureDetector(
                onTap: () {
                  FormTransportModel formodal = FormTransportModel();
                  Navigator.push(
                    context,
                    formodal.modalFormTransport(context) as Route<Object?>,
                  );
                },
                child: GFCard(
                  elevation: 3,
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  // image: Image.asset(
                  //   'lib/assets/cup.jpg',
                  //   height: MediaQuery.of(context).size.height * 0.2,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.cover,
                  // ),
                  // showImage: true,
                  title: GFListTile(
                    // icon: Image.asset('/assets/images/registrocarga.png',height: 50,),
                    titleText: 'Registro de carga',
                  ),
                  content: Text("Registra tu carga para enviarla en el momento que gustes"),
                  buttonBar: GFButtonBar(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/registrocarga.png',
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: GestureDetector(
                onTap: () {
                  CotizacionModal cotizacionmodal = CotizacionModal();
                  Navigator.push(
                    context,
                    cotizacionmodal.modalFormTransport(context)
                        as Route<Object?>,
                  );
                },
                child: GFCard(
                  elevation: 3,
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  // image: Image.asset(
                  //   'lib/assets/cup.jpg',
                  //   height: MediaQuery.of(context).size.height * 0.2,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.cover,
                  // ),
                  // showImage: true,
                  title: GFListTile(
                    titleText: 'Cotizaciones',
                  ),
                  content: Text("Consulta los precios de los servicios de entrega"),
                  buttonBar: GFButtonBar(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/lucro.png',
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ]),
          Text('Tipos de transporte',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          GFCarousel(height: 250, items: [
            SizedBox(
              height: 250,
              child: GestureDetector(
                onTap: () {
                  TransporteLivianoModal transportemodal =
                      TransporteLivianoModal();
                  Navigator.push(
                    context,
                    transportemodal.modalFormTransport(context)
                        as Route<Object?>,
                  );
                },
                child: GFCard(
                  elevation: 3,
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  // image: Image.asset(
                  //   'lib/assets/cup.jpg',
                  //   height: MediaQuery.of(context).size.height * 0.2,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.cover,
                  // ),
                  // showImage: true,
                  title: GFListTile(
                    titleText: 'Transporte pesado',
                  ),
                  content: Text("Cargas muy grandes, con capacidad de hasta 1 tonelada"),
                  buttonBar: GFButtonBar(
                    children: <Widget>[
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/semi.png',
                            height: 50,
                          ),
                          GFButton(
                            onPressed: () {
                              TransporteLivianoModal transportemodal =
                                  TransporteLivianoModal();
                              Navigator.push(
                                context,
                                transportemodal.modalFormTransport(context)
                                    as Route<Object?>,
                              );
                            },
                            text: "Ver conductores",
                            shape: GFButtonShape.pills,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: GestureDetector(
                onTap: () {
                  TransporteLivianoModal transportemodal =
                      TransporteLivianoModal();
                  Navigator.push(
                    context,
                    transportemodal.modalFormTransport(context)
                        as Route<Object?>,
                  );
                },
                child: GFCard(
                  elevation: 3,
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  // image: Image.asset(
                  //   'lib/assets/cup.jpg',
                  //   height: MediaQuery.of(context).size.height * 0.2,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.cover,
                  // ),
                  // showImage: true,
                  title: GFListTile(
                    titleText: 'Transporte mediano',
                  ),
                  content: Text("Cargas de hasta 1/2 tonelada"),
                  buttonBar: GFButtonBar(
                    children: <Widget>[
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/semi2.png',
                            height: 50,
                          ),
                          GFButton(
                            onPressed: () {
                              TransporteLivianoModal transportemodal =
                                  TransporteLivianoModal();
                              Navigator.push(
                                context,
                                transportemodal.modalFormTransport(context)
                                    as Route<Object?>,
                              );
                            },
                            text: "Ver conductores",
                            shape: GFButtonShape.pills,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: GestureDetector(
                onTap: () {
                  TransporteLivianoModal transportemodal =
                      TransporteLivianoModal();
                  Navigator.push(
                    context,
                    transportemodal.modalFormTransport(context)
                        as Route<Object?>,
                  );
                },
                child: GFCard(
                  boxFit: BoxFit.cover,
                  titlePosition: GFPosition.start,
                  // image: Image.asset(
                  //   'lib/assets/cup.jpg',
                  //   height: MediaQuery.of(context).size.height * 0.2,
                  //   width: MediaQuery.of(context).size.width,
                  //   fit: BoxFit.cover,
                  // ),
                  // showImage: true,
                  title: GFListTile(
                    titleText: 'Transporte liviano',
                  ),
                  content: Flexible(child: Text("Especial para poder llevar articulos de mudanza")),
                  buttonBar: GFButtonBar(
                    children: <Widget>[
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/liviano.png',
                            height: 50,
                          ),
                          GFButton(
                            onPressed: () {
                              TransporteLivianoModal transportemodal =
                                  TransporteLivianoModal();
                              Navigator.push(
                                context,
                                transportemodal.modalFormTransport(context)
                                    as Route<Object?>,
                              );
                            },
                            text: "Ver conductores",
                            shape: GFButtonShape.pills,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
