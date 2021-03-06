import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';
import 'package:flutter_application_1/controllers/registro_controller.dart';
import 'package:flutter_application_1/src/pages/login.dart';
import 'package:get/get.dart';

void main() {
  Get.put(EmailController());
  Get.put(RegistroController());
  runApp(const MainLogin());
}
