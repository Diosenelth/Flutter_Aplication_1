import 'package:flutter/material.dart';



class social extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_pageState();
}


class _pageState extends State<social> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Actividades',
      style: optionStyle,
    ),
    Text(
      'Index 1: Social',
      style: optionStyle,
    ),
    Text(
      'Index 2: Estados',
      style: optionStyle,
    ),
    Text(
      'Index 3: Menu',
      style: optionStyle,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vista Social"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
        ),

        bottomNavigationBar: BottomNavigationBar (
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: "Actividades",
              backgroundColor:Colors.red[900],
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.done),
              label: "Social",
              backgroundColor:Colors.blue[800],
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.edit),
              label: "Estados",
              backgroundColor:Colors.purple[800],
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: "Menu",
              backgroundColor:Colors.pink[800],
              ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
          ),
  );
}



    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _TextFields(){
    return [
      texto("Usuario"),
      textField(false,'Usuario'),
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
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
        }
      },
      child: Text(texto)
      ),
    );
  }
}