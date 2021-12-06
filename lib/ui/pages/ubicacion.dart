// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class Ubicacion extends StatelessWidget {
  const Ubicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ListView());
  }

  static Card title() {
    return Card(
        child: Container(
      margin: const EdgeInsets.all(2),
      height: 30,
      decoration: const BoxDecoration(color: Colors.blue),
      child: const Text(
        'EVENTOS CERCA DE TI',
        style: TextStyle(color: Colors.white, fontSize: 20),
        textAlign: TextAlign.center,
      ),

      /*tileColor: Colors.white,
              title: Text('EVENTOS CERCA DE TI', textAlign: TextAlign.center),
              tileColor: Colors.white,*/
    ));
  }

  static Card cardUbicar2() {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Icon(Icons.note_outlined),
                onPressed: () {/*...*/},
              ),
              const SizedBox(width: 8),
            ],
          ),
          const ListTile(
            title: Text('11DIC - SALON DEL LIBRO INFANTIL',
                textAlign: TextAlign.center),
            subtitle: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis'
                'eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,'
                'vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const <Widget>[
              Text('Experiencia: '),
              //const SizedBox(width: 25),
              Text('Pago: '),
            ],
          ),
        ],
      ),
    );
  }

  static Card cardUbicar() {
    // double pinPillPosition = -100;
    // String pinPath = '';
    String foto = 'images/AV1.png';
    LatLng ubica = const LatLng(0, 0);
    String locationName = 'MI UBICACION';
    Color labelColor = Colors.red;

    return Card(
      child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: const EdgeInsets.all(20),
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset.zero,
                      color: Colors.grey.withOpacity(0.5))
                ]),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 50,
                    height: 50,
                    margin: const EdgeInsets.only(left: 10),
                    child:
                        ClipOval(child: Image.asset(foto, fit: BoxFit.cover)),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(locationName,
                              style: TextStyle(color: labelColor)),
                          Text('Latitud: ${ubica.latitude.toString()}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey)),
                          Text('Longitud: ${ubica.longitude.toString()}',
                              style: const TextStyle(
                                  fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        children: [
                          TextButton(
                              onPressed: () => {},
                              child: const Text('Buscar Eventos',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.redAccent)))
                        ],
                      )),
                ]),
          ),
        ),
      ]),
    );
  }
}
