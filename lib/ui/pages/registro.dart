import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';
import 'package:flutter_application_1/controllers/registro_controller.dart';
import 'package:flutter_application_1/providers/icon_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

RegistroController registroController=Get.find();
EmailController emailController=Get.find();

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageState();
}

class _PageState extends State<Registro> {
  @override
  Widget build(BuildContext context) {
  final pricon=Provider.of<IconDarkTheme>(context);

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

  List<Widget> _textFields(){
    return [
      texto("Usuario"),
      usuarioField(false,'Usuario'),
      const SizedBox(height: 10),
      texto("Correo Electronico"),
      emailField(false,'Correo electronico'),
      const SizedBox(height: 10),
      texto("Contraseña"),
      passField(true,'Contraseña'),
      const SizedBox(height: 20),
      
      _crearBotones()
    ];
  }

  Text texto(String texto){
    return Text(
        texto,
        textAlign: TextAlign.justify,
         style: const TextStyle(fontSize: 25),
         );
  }

TextField usuarioField(bool bool, String texto){
  return TextField(
        textCapitalization: TextCapitalization.sentences,
        obscureText: bool,
                decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: texto,
          icon: const Icon(Icons.account_circle)
        ),
        onChanged: (valor)=>registroController.usuario(valor),
      );
}

TextField emailField(bool bool, String texto){
  return TextField(
    keyboardType: TextInputType.emailAddress,
        obscureText: bool,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: texto,
          icon:  const Icon(Icons.email),
        ),
        onChanged: (valor)=>registroController.email(valor),
      );
}
TextField passField(bool bool, String texto){
  return TextField(
        obscureText: bool,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          labelText: texto,
          counter: Obx(()=>Text(registroController.getPass.length.toString())),
          icon:  const Icon(Icons.password),
        ),
        onChanged: (valor)=>registroController.pass(valor),
      );
}
  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      elevatedButton("Iniciar"),
      const SizedBox(width: 8.0),
      registerButton('Registrarse'),
    ],
    );
  }
  
  SizedBox elevatedButton(String texto){
    return SizedBox(
      height: 40.0,
      width: 120,
      child:ElevatedButton(
      onPressed: (){
          Get.back();
      },
      child: Text(texto)
      ),
    );
  }
  
    SizedBox registerButton(String texto){
    return SizedBox(
      height: 40.0,
      width: 120,
      child:ElevatedButton(
      onPressed: (){
        if (registroController.getUsuario.isNotEmpty && registroController.validarEmail()&&registroController.getPass.length>=8) {
          setState(() {
          emailController.email(registroController.getEmail);            
          });      
          Get.back();
        }else if (registroController.getUsuario.isEmpty) {
          Fluttertoast.showToast(
            msg: 'Usuario vacio',
            toastLength: Toast.LENGTH_SHORT,
          );          
        }else if (!registroController.validarEmail()) {
          Fluttertoast.showToast(
            msg: 'Email Invalido',
            toastLength: Toast.LENGTH_SHORT,
          );          
        }else if (registroController.getPass.length<8) {
          Fluttertoast.showToast(
            msg: 'Contraseña no segura',
            toastLength: Toast.LENGTH_SHORT,
          );          
        }
      },
      child: Text(texto)
      ),
    );
  }
}