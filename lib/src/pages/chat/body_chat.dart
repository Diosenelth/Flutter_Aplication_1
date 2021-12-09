import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/pages/chat/Chaters.dart';

import 'card_chat.dart';
import 'sala_chat.dart';

class bodyChat extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.purpleAccent,
          child: Row(
            
            children: [
              SizedBox(width: 4,),          
              OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.purpleAccent.withOpacity(0.5), width: 2),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                )
              ),
              onPressed: () {}, 
              child: Text("Recientes", style: TextStyle(color: Colors.purpleAccent),)
              ),
              SizedBox(width: 4,),
              OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.purpleAccent.withOpacity(0.3),
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(18),)
                ),
              ),
              onPressed: () {}, 
              child: Text("Activos", style: TextStyle(color: Colors.white),),
              
              ),
            ],
          )
        ),
        Expanded(child: ListView.builder(
          itemCount: listaChat.length,
          itemBuilder: (context, index) => cardChat(
            chaters: listaChat[index], 
            press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => salaChat()))
          ),
        )
        ),
      ],
    );
  }
}
