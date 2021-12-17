// ignore_for_file: unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication_controller.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';
import 'package:flutter_application_1/controllers/registro_controller.dart';
import 'package:flutter_application_1/providers/icon_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

RegistroController registroController = Get.find();
EmailController emailController = Get.find();
AuthenticationController authenticationController = Get.find();

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
    final pricon = Provider.of<IconDarkTheme>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrarse"),
        actions: <Widget>[
          IconButton(
            icon: pricon.icon,
            onPressed: () {
              setState(() {
                pricon.seticon();
              });
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
            // Text(
            //   "Iniciar Sesion",style:TextStyle(fontSize: 30),
            //   textAlign: TextAlign.start,
            // ),
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _textFields(),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _textFields() {
    return [
      // texto("Usuario"),
      // usuarioField(false,'Usuario'),
      // const SizedBox(height: 10),
      texto("Correo Electronico"),
      const SizedBox(height: 10),
      emailField(false, 'Correo electronico'),
      const SizedBox(height: 10),
      texto("Contraseña"),
      const SizedBox(height: 10),
      passField(true, 'Contraseña'),
      const SizedBox(height: 20),

      _crearBotones()
    ];
  }

  Text texto(String texto) {
    return Text(
      texto,
      textAlign: TextAlign.justify,
      style: const TextStyle(fontSize: 25),
    );
  }

  TextField usuarioField(bool bool, String texto) {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      obscureText: bool,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: texto,
          icon: const Icon(Icons.account_circle)),
      onChanged: (valor) => registroController.usuario(valor),
    );
  }

  TextField emailField(bool bool, String texto) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: bool,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: texto,
        icon: const Icon(Icons.email),
      ),
      onChanged: (valor) => registroController.email(valor),
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
        counter: Obx(() => Text(registroController.getPass.length.toString())),
        icon: const Icon(Icons.password),
      ),
      onChanged: (valor) => registroController.pass(valor),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        elevatedButton("Iniciar"),
        const SizedBox(width: 8.0),
        registerButton('Registrarse'),
      ],
    );
  }

  SizedBox elevatedButton(String texto) {
    return SizedBox(
      height: 40.0,
      width: 120,
      child: ElevatedButton(
        onPressed: () {
          Get.back();
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
          FocusScope.of(context).requestFocus(FocusNode());
          if (registroController.isEmail(registroController.getEmail) &&
              registroController.getPass.length >= 8) {
            _signup(registroController.getEmail, registroController.getPass);
          } else if (registroController.getEmail.length<10) {
            Fluttertoast.showToast(
              msg: 'Email Invalido',
              toastLength: Toast.LENGTH_SHORT,
            );
          } else if (registroController.getPass.length < 8) {
            Fluttertoast.showToast(
              msg: 'Contraseña no segura',
              toastLength: Toast.LENGTH_SHORT,
            );
          }
        },
          child: Text(texto)),
    );
  }

  _signup(theEmail, thePassword) async {
    try {
      await authenticationController.signUp(theEmail, thePassword);
      setState(() {
        Get.snackbar(
          "Registro",
          'Correcto',
          icon: const Icon(Icons.person, color: Colors.blue),
          snackPosition: SnackPosition.BOTTOM,
        );
        emailController.email(registroController.getEmail);
        Timer _timer;
        _timer = Timer.periodic(const Duration(seconds: 2), (_) => Get.back());
      });


      // Get.back();
    } catch (err) {
      Get.snackbar(
        "registro",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
