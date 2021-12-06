import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/ui/pages/login.dart';
import 'package:flutter_application_1/ui/pages/social.dart';

class FirebaseCentral extends StatelessWidget {
  const FirebaseCentral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // EmailController emailController=Get.find();
          // emailController.email();
          return const Social();
        } else {
          return const Login();
        }
      },
    );
  }
}
