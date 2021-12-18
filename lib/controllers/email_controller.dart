// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';

class EmailController extends GetxController {
  final _email = "".obs;
  final _clave = "".obs;

  String get getEmail => _email.value;
  String get getPass => _clave.value;

  email(String email) {
    _email.value = email;
  }

  pass(String pass) {
    _clave.value = pass;
  }




  bool isEmail(String string) {
  // Null or empty string is invalid
  if (string == null || string.isEmpty) {
    return false;
  }

  const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(string)) {
    return false;
  }
  return true;
}
  // bool validaremail() => EmailValidator.validate(_email.value);
}
