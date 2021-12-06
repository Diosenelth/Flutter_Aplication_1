import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';

import 'package:flutter_application_1/ui/pages/login.dart';
import 'package:flutter_application_1/ui/pages/social.dart';
import 'package:get/get.dart';


class FirebaseCentral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // EmailController emailController=Get.find();
          // emailController.email();
          return Social();

        } else {
          return Login();
        }
      },
    );
  }
}
