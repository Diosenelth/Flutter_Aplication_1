import "package:flutter/material.dart";
import 'chat/body_chat.dart';

class chatApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraSuper(),
      body: bodyChat(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.purpleAccent,
        child: Icon(Icons.person_add_alt_1, color: Colors.white),
        ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Actividades",
            ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: "Llamar",
            ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 14,
              backgroundImage: AssetImage("assets/Portrait_Placeholder.png"),),
            label: "perfil",

            )
        ]
      ),
    );
  }

  AppBar barraSuper() {
    return AppBar(
      title: Text("C H A T S"),
      elevation: 0,
      backgroundColor: Colors.purpleAccent,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          icon: Icon(Icons.search), 
          onPressed: () {}
        )
      ],
    );
  }
}