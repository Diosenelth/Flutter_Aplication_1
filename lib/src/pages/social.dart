import 'package:flutter/material.dart';


// ignore: import_of_legacy_library_into_null_safe
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/src/pages/menu.dart';



class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_PageState();
}


class _PageState extends State<Social> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  List<Widget> _widgetOptions = <Widget>[
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
    menuApp(),
  ];


  @override
  Widget build(BuildContext context) {
    EmailController emailController=Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text('Social de ${emailController.getEmail.toString()}'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
        ),

        bottomNavigationBar:
        FlipBoxBar(
            selectedIndex: _selectedIndex,
          items:[
            FlipBarItem(icon: const Icon(Icons.notifications),
             text: const Text("Actividades"),frontColor: Colors.red[900],
               backColor: Colors.red[500]),
            FlipBarItem(icon: const Icon(Icons.add),
             text: const Text("Social"), frontColor: Colors.blue[900],
              backColor: Colors.blue[500]),
            FlipBarItem(icon: const Icon(Icons.chrome_reader_mode),
             text: const Text("Estados"), frontColor: Colors.purple[900],
              backColor: Colors.purple[500]),
            FlipBarItem(icon: const Icon(Icons.print),
             text: const Text("Menu"), frontColor: Colors.pink[900],
              backColor: Colors.pink[500]),
          ],
           onIndexChanged: _onItemTapped,
        ),
/*
         BottomNavigationBar (
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.notifications),
              label: "Actividades",
              backgroundColor:Colors.red[900],
              ),
              BottomNavigationBarItem(
              icon: const Icon(Icons.done),
              label: "Social",
              backgroundColor:Colors.blue[800],
              ),
              BottomNavigationBarItem(
              icon: const Icon(Icons.edit),
              label: "Estados",
              backgroundColor:Colors.purple[800],
              ),
              BottomNavigationBarItem(
              icon: const Icon(Icons.menu),
              label: "Menu",
              backgroundColor:Colors.pink[800],
              ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.black,
          onTap: _onItemTapped,
          ),*/
  );
}



    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


}