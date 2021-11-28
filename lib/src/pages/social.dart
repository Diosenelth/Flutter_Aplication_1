import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


// ignore: import_of_legacy_library_into_null_safe
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';
import 'package:get/get.dart';



class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_PageState();
}


class _PageState extends State<Social> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  static List cardsActividad = List.generate(4, (i)=> cardActivity());
  static List cardsSocial = List.generate(4, (i)=> cardSocialandEstado("SOCIAL"));
   static List cardsEstado = List.generate(4, (i)=> cardSocialandEstado("ESTADO"));

  final List<Widget> _widgetOptions = <Widget>[
    ListView(
        children: [...cardsActividad],
      ),
    ListView(
        children: [
          ..._textFields("SOCIAL"),
          ...cardsSocial],
    ), 
    ListView(
        children: [
          ..._textFields("ESTADO"),
          ...cardsEstado],
    ),
    const Text(
      'Index 3: Menu',
      style: optionStyle,
    ),
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
            navBarHeight: 40.0,
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

  static List<Widget> _textFields(String vista){
      return [
        const SizedBox(height: 10),
        texto(vista == "SOCIAL" ? "Publique contenido: " : "Publique estado:"),
        const SizedBox(width: 10),      
        fieldSocialandEstado(false,vista == "SOCIAL" ? "Social" : "Estado"),
        const SizedBox(height: 10),
        _buttonPublicar(vista == "SOCIAL" ? "SOCIAL" : "ESTADO"),
        const SizedBox(height: 10),
      ];
  }

  static Text texto(String texto){
    return Text(
        texto,
        textAlign: TextAlign.justify,
         style: const TextStyle(fontSize: 15),
         );
  }

  static TextField fieldSocialandEstado(bool bool, String texto){
    return TextField(    
          keyboardType: TextInputType.multiline,
          textInputAction: TextInputAction.newline,
          minLines: 1,
          maxLines: 5,
          obscureText: bool,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            labelText: texto,
          ),
        );
  }


  static Widget _buttonPublicar(String vista){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      publicarActionButton("Publicar", vista),
    ],
    );
  }

  static SizedBox publicarActionButton(String texto, String vista){
    return SizedBox(
      height: 40.0,
      width: 100,
      child:ElevatedButton(
      onPressed: (()=>{
         if (vista == "SOCIAL") {
          print(vista)
        }else {
          print(vista)
        }
      }),
      child: Text(texto)
      ),
    );
  }

static Card cardActivity(){
      return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Icon(Icons.note_outlined),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
            const ListTile(
              title: Text('Evento 1', textAlign: TextAlign.center),
              subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis'
              'eleifend porttitor felis. Cras vitae dolor vitae arcu pellentesque maximus a sit amet erat. Aliquam elementum pulvinar ex,'
              'vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  'Experiencia: '
                ),
                //const SizedBox(width: 25),
                Text(
                  'Pago: '
                ),
              ],
            ),
          ],
        ),
      );
  }

  static Card cardSocialandEstado(String vista){
    if (vista == "SOCIAL") {
      return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Icon(Icons.colorize_rounded),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
            const ListTile(
              title: Text('Fulano 1', textAlign: TextAlign.center),
              subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis'
              'vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.'),
            ),
          ],
        ),
      );
    }else{
       return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 5.0,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Icon(Icons.colorize_rounded),
                  onPressed: () {/* ... */},
                ),
                const SizedBox(width: 8),
              ],
            ),
            const ListTile(
              title: Text('Fulano 2', textAlign: TextAlign.center),
              subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis'),
            ),
          ],
        ),
      );
    } 
  }

    

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


}