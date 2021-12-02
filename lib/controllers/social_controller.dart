//import 'dart:collection';
// import 'dart:convert';

// import 'package:flutter_application_1/controllers/social.json';
import 'package:get/state_manager.dart';

class SocialController extends GetxController{

  // String _nombreActividad = "Event 1".obs;
  // String _descripcionActividad = "Event 1".obs;
  //final HashMap<String, dynamic> _dataActividad = jsonDecode("");
  final RxList<Map<String, dynamic>> _dataActividad = [
    {
        "nombre":"Evento 1",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",
        "experiencia": "mucha",
        "pago": 10000
    },
    {
        "nombre":"Evento 2",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",
        "experiencia": "poca",
        "pago": 2000
    },
    {
        "nombre":"Evento 3",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",
        "experiencia": "poca",
        "pago": 3000
    }

  ].obs;

  final RxList<Map<String, dynamic>> _dataSocial = [
    {
        "nombreUsuario":"Fulano 1",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",
       
    },
    {
        "nombreUsuario":"Fulano 2",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",
        
    },
    {
        "nombreUsuario":"Fulano 3",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",

    }

  ].obs;

  final RxList<Map<String, dynamic>> _dataEstados = [
    {
        "nombreUsuario":"Fulano 4",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",
       
    },
    {
        "nombreUsuario":"Fulano 5",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",
        
    },
    {
        "nombreUsuario":"Fulano 6",
        "descripcion":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.",

    }

  ].obs;

  final RxString _publicacionSocial = "".obs;
  final RxString _publicacionEstado = "".obs;

  RxList<Map<String, dynamic>> get getDataActividad =>_dataActividad;
  RxList<Map<String, dynamic>> get getDataSocial =>_dataSocial;
  RxList<Map<String, dynamic>> get getDataEstados =>_dataEstados;
  RxString get getPublicacionSocial => _publicacionSocial;
  RxString get getPublicacionEstado => _publicacionEstado;

  setPublicacionSocial(String publicacion){
    _publicacionSocial.value=publicacion;
  }

  setPublicacionEstado(String publicacion){
    _publicacionEstado.value=publicacion;
  }
}