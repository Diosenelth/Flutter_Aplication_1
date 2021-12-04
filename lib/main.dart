import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';
import 'package:flutter_application_1/controllers/registro_controller.dart';

import 'package:get/get.dart';

import 'controllers/social_controller.dart';
import 'ui/pages/login.dart';
import 'package:loggy/loggy.dart';


void main() {
    WidgetsFlutterBinding.ensureInitialized();
    Loggy.initLoggy(
      logPrinter: const PrettyPrinter(
        showColors: true,
    ),
  );
  Get.put(EmailController());
  Get.put(RegistroController());
  Get.put(SocialController());
  runApp(MainLogin());
}
