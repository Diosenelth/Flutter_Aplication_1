import 'package:get/get.dart';

class EmailController extends GetxController{
  var _email="".obs;
  var _clave="".obs;


  String get getEmail=> _email.value;
  String get getPass=> _clave.value;

  correo (String email){
    _email.value=email;
  }

  pass (String pass){
    _clave.value=pass;
  }
}