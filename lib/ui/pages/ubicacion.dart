// ignore_for_file: import_of_legacy_library_into_null_safe


import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication_controller.dart';
import 'package:flutter_application_1/controllers/location_controller.dart';
import 'package:flutter_application_1/model/location.dart';
import 'package:get/get.dart';

LocationController location=Get.find();
AuthenticationController authenticationController = Get.find();


class Ubicacion extends StatefulWidget {
  const Ubicacion({Key? key}) : super(key: key);

  @override
  State<Ubicacion> createState() => _UbicacionState();
}

class _UbicacionState extends State<Ubicacion> {

  @override
  void initState() {
    super.initState();
    location.start();
  }

  @override
  void dispose() {
    location.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: loc(),
    );
  }


  loc(){
    String email = authenticationController.userEmail();
        return GetX<LocationController>(builder: (controller) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: location.ubicacion.length,
        itemBuilder: (context, index) {
          var element = location.ubicacion[index];
          return _item(element, index, email);
        },
      );
    });
  }


      Widget _item(Location element, int posicion, String email) {
    // logInfo('Current user? -> ${uid == element.user} msg -> ${element.text}');
      return Card(
        margin: const EdgeInsets.all(4.0),
        color: email == element.user ? Colors.blue[400] : Colors.grey[500],
        child: ListTile(
          title: Text(
            "Ubicacion: "+element.latitud+" "+element.longitud,
            textAlign: email == element.user ? TextAlign.right : TextAlign.left,
          ),
          subtitle: Text(
            element.user,
            textAlign: email == element.user ? TextAlign.right : TextAlign.left,
          ),
        ),
      );
  }

}
