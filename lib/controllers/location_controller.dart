// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/model/location.dart';
import 'package:get/get.dart';

import 'authentication_controller.dart';

class LocationController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.reference();
  var ubicacion = <Location>[].obs;
  AuthenticationController authenticationController = Get.find();


  start() {
    databaseReference
        .child("Ubicaciones")
        .onChildAdded
        .listen(_onEntryAdded);
  }

  stop() {
    databaseReference
        .child("Ubicaciones")
        .onChildAdded
        .listen(_onEntryAdded)
        .cancel();
        ubicacion.clear();
  }

  _onEntryAdded(Event event) {
    print("Something was added");
    ubicacion.add(Location.fromSnapshot(event.snapshot));
  }

  Future<void> sendUbicacion(String text, String latitud, String longitud) async {
    String email = authenticationController.userEmail();
    try {
      databaseReference
          .child("Ubicaciones")
          .push()
          .set({
            'user': email,
           'latitud': latitud,
           'longitud':longitud
           });
           print("Ubicacion Enviada");
    } catch (error) {
      print("Error sending ubicacion");
      return Future.error(error);
    }
  }
}
