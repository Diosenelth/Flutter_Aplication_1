import 'package:flutter/material.dart';
final conteo=10;

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mi App"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hola mundo', style: (TextStyle(fontSize: 30)),),
            Text('$conteo'),
          ],
        )
        ),
floatingActionButton: FloatingActionButton(
  child: Icon(Icons.add),
   onPressed: () {
     print("oject");
     //conteo+=1;
     }
  ),floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}