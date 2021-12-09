import 'package:flutter/material.dart';
import 'body_sala.dart';

class salaChat extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barSalaChat(),
      body: bodySala(),
    );
  }

  AppBar barSalaChat() {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Colors.purpleAccent,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/Portrait_Placeholder.png"),
          ),
          SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nombre Apellido", style: TextStyle(fontSize: 12,)),
              Text("2 min", style: TextStyle(fontSize: 10)),
            ],
            )
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.videocam), 
          onPressed: () {}

        )
      ],
    );
  }
}