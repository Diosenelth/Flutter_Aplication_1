// ignore: import_of_legacy_library_into_null_safe
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class EmailController extends GetxController{
  final _email="".obs;
  final _clave="".obs;


  String get getEmail=> _email.value;
  String get getPass=> _clave.value;

  email (String email){
    _email.value=email;
  }

  pass (String pass){
    _clave.value=pass;
  }

  bool validaremail()=>EmailValidator.validate(_email.value);
}