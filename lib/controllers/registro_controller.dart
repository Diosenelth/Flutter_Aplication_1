
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class RegistroController extends GetxController{
  final _usuario="".obs;
  final _email="".obs;
  final _pass="".obs;

  String get getPass=>_pass.value;
  String get getEmail=>_email.value;
  String get getUsuario=>_usuario.value;

  pass(String pass)=>_pass.value=pass;
  email(String email)=>_email.value=email;
  usuario(String usuario)=>_usuario.value=usuario;

  validarEmail()=>EmailValidator.validate(_email.value);
}