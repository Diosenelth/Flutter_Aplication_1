import 'package:get/get.dart';

class RegistroController extends GetxController {
  final _usuario = "".obs;
  final _email = "".obs;
  final _pass = "".obs;

  String get getPass => _pass.value;
  String get getEmail => _email.value;
  String get getUsuario => _usuario.value;

  pass(String pass) => _pass.value = pass;
  email(String email) => _email.value = email;
  usuario(String usuario) => _usuario.value = usuario;

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
  // validarEmail() => EmailValidator.validate(_email.value);
}
