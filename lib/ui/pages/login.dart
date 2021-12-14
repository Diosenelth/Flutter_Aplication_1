// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication_controller.dart';
import 'package:flutter_application_1/controllers/chat_controller.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';
import 'package:flutter_application_1/controllers/firestore_controller.dart';
import 'package:flutter_application_1/controllers/registro_controller.dart';
import 'package:flutter_application_1/controllers/social_controller.dart';
import 'package:flutter_application_1/providers/icon_provider.dart';
import 'package:flutter_application_1/ui/pages/social.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_central.dart';
import 'registro.dart';

class MainLogin extends StatelessWidget {
  MainLogin({Key? key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp( 
    // Replace with actual values
    options: const FirebaseOptions(
    
      apiKey: "AIzaSyAHhRsIjUZhxqFGS__HdZkv10dcTphmQwo",
      authDomain: "app-flutter-4af40.firebaseapp.com",
      databaseURL: "https://app-flutter-4af40-default-rtdb.firebaseio.com",
      projectId: "app-flutter-4af40",
      storageBucket: "app-flutter-4af40.appspot.com",
      messagingSenderId: "350591926229",
      appId: "1:350591926229:web:041fa703aa1d8590d2075c",
    ),
  );

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => IconDarkTheme(),
      child: Consumer<IconDarkTheme>(
        builder: (context, theme, _) => GetMaterialApp(
            theme: ThemeData(
              brightness: theme.brightness,
              primarySwatch: Colors.blue,
            ),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: FutureBuilder(
                    // Initialize FlutterFire:
                    future: _initialization,
                    builder: (context, snapshot) {
                      // check for errors
                      if (snapshot.hasError) {
                        print("error ${snapshot.error}");
                        return const Center(
                          child: Text('No se pudo conectar'),
                        );
                      }
                      // Once complete, show your application

                      if (snapshot.connectionState == ConnectionState.done) {
                        Get.put(EmailController());
                        Get.put(RegistroController());
                        Get.put(AuthenticationController());
                        Get.put(FirebaseController());
                        Get.put(ChatController());
                        Get.put(SocialController());
                        return const FirebaseCentral();
                      }

                      // Otherwise, show something while waiting for initialization complete
                      return const Center(
                        child: Text('Intentando conectarse'),
                      );
                    }))),
      ),
    );
  }
}

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Login> {
  EmailController emailController = Get.find();
  AuthenticationController authenticationController = Get.find();
  @override
  Widget build(BuildContext context) {
    final pricon = Provider.of<IconDarkTheme>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Iniciar sesion"),
        actions: <Widget>[
          IconButton(
            icon: pricon.icon,
            onPressed: () {
              // setState(() {
                pricon.seticon();
              // });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _textFields()

              ),
            )
          ],
        ),
      ),
    );
  }


  _permisos ()async {
    if(await Permission.location.request().isGranted){
    }
    if(await Permission.location.isPermanentlyDenied){
      openAppSettings();
    }
  } 
  List<Widget> _textFields() {
    return [
      // texto("Usuario"),
      // textField(false,'Usuario'),
      const SizedBox(height: 10),
      texto("Correo Electronico"),
      const SizedBox(height: 10),
      emailField(false, 'Correo electronico'),
      const SizedBox(height: 10),
      texto("Contraseña"),
      const SizedBox(height: 10),
      passField(true, 'Contraseña'),
      const SizedBox(height: 20),

      _crearBotones(),
      _permisos()
    ];
  }

  Text texto(String texto) {
    return Text(
      texto,
      textAlign: TextAlign.justify,
      style: const TextStyle(fontSize: 25),
    );
  }

  TextField emailField(bool bool, String texto) {
    return TextField(
      // controller: TextEditingController()..text = emailController.getEmail,
      keyboardType: TextInputType.emailAddress,
      obscureText: bool,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: texto,
        icon: const Icon(Icons.account_circle)
      ),
      onChanged: (valor) => emailController.email(valor),
    );
  }

  TextField passField(bool bool, String texto) {
    return TextField(
      obscureText: bool,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: texto,
        counter: Obx(() => Text(emailController.getPass.length.toString())),
        icon: const Icon(Icons.lock_open),
      ),
      onChanged: (valor) => emailController.pass(valor),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        loginButton("Iniciar"),
        const SizedBox(width: 8.0),
        registerButton('Registrarse'),
      ],
    );
  }

  SizedBox loginButton(String texto) {
    return SizedBox(
      height: 40.0,
      width: 120,
      child: ElevatedButton(
          onPressed: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            if (emailController.getEmail.isNotEmpty &&
                emailController.getPass.length >= 8) {
              await _login(emailController.getEmail, emailController.getPass);
            } else if (!emailController.validaremail() ||
                emailController.getEmail.isEmpty) {
              Fluttertoast.showToast(
                msg: 'Email invalido',
                toastLength: Toast.LENGTH_SHORT,
              );
            } else if (emailController.getPass.length < 8) {
              Fluttertoast.showToast(
                msg: 'Contraseña no segura',
                toastLength: Toast.LENGTH_SHORT,
              );
            }
          },
          child: Text(texto)),
    );
  }

  SizedBox registerButton(String texto) {
    return SizedBox(
      height: 40.0,
      width: 120,
      child: ElevatedButton(
          onPressed: () {
            Get.to(const Registro())!.then((value) {
              setState(() {});
            });
          },
          child: Text(texto)),
    );
  }

  _login(theEmail, thePassword) async {
    // print('_login $theEmail $thePassword');
    try {
      await authenticationController.login(theEmail, thePassword);
      Get.off(const Social());
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
