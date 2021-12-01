import "package:flutter/material.dart";
import 'package:flutter_application_1/src/pages/chat.dart';

class menuApp extends StatefulWidget {
  menuApp({Key? key}) : super(key: key);

  @override
  _menuAppState createState() => _menuAppState();
}

class _menuAppState extends State<menuApp> {
  @override
  Widget build(BuildContext context) {







    return Scaffold(
      appBar: AppBar(title: Text("Menu"), centerTitle: true,),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              
              SizedBox(height: 15,),
              //boton Chat
              SizedBox(height: 15,),
              Text("C H A T", 
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold,
              )),
              IconButton(
              icon: Icon(Icons.message),
              iconSize: 50,
              color: Colors.brown,
              tooltip: 'Haz nuevos amigos en el chat',
              onPressed: () {
              setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => chatApp()));
              });
              },              
              ),
              SizedBox(height: 15,),

            ]
          )
        )
      )
    );
  }
}