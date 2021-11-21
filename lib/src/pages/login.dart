import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/registro.dart';
import 'package:flutter_application_1/src/pages/social.dart';

String usuario="",clave="";

class mainLogin extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Center(
        child: login(),
      ),
      routes: {
        "/social": (_)=>social(),
        "/registro": (_)=>registro(),
      },
    );
  }

}


class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _pageState();
}

class _pageState extends State<login> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text("Iniciar sesion"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              // Text(
              //   "Iniciar Sesion",style:TextStyle(fontSize: 30),
              //   textAlign: TextAlign.start,
              // ),
              Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _TextFields(),
              ),
              )
            ],
          ),
          ),
      // routes: {
      //   "/social": (context)=>social(),
      // },
    );
  
  }

  List<Widget> _TextFields(){
    return [
      // texto("Usuario"),
      // textField(false,'Usuario'),
      SizedBox(height: 10),
      texto("Correo Electronico"),
      textField(false,'Correo electronico'),
      SizedBox(height: 10),
      texto("Contraseña"),
      textField(true,'Contraseña'),
      SizedBox(height: 20),
      
      _crearBotones()
    ];
  }

  Text texto(String texto){
    return Text(
        texto,
        textAlign: TextAlign.justify,
         style: TextStyle(fontSize: 25),
         );
  }

TextField textField(bool bool, String texto){
  return TextField(
        obscureText: bool,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: texto,
        ),
      );
}

  Widget _crearBotones(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      elevatedButton("Iniciar"),
      SizedBox(width: 8.0),
      elevatedButton('Registrarse'),
    ],
    );
  }
  
  SizedBox elevatedButton(String texto){
    return SizedBox(
      height: 40.0,
      width: 120,
      child:ElevatedButton(
      onPressed: (){
        if (texto=="Iniciar") {
          Navigator.pushReplacementNamed(context, "/social");
          // Navigator.push(context, 
          // MaterialPageRoute(builder: (context)=>social()));
        } else {
          Navigator.pushNamed(context, "/registro");
        }
      },
      child: Text(texto)
      ),
    );
  }


}