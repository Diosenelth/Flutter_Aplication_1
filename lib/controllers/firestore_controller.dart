
import 'package:flutter_application_1/model/record.dart';
import 'package:get/get.dart';

class FirebaseController extends GetxController {
  var _records = <Record>[].obs;

  List<Record> get entries => _records;
  
  //Implementa los getters necesarios para los datos y el stream


  @override
  void onInit() {
    suscribeUpdates();
    super.onInit();
  }

  //Implementa el metodo para suscribirse a cambios en lo datos
  suscribeUpdates() async {}

  //Implementa el metodo para agregar datos en firestore
  addEntry(name) { 
  }
}
