import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


// ignore: import_of_legacy_library_into_null_safe
import 'package:flip_box_bar/flip_box_bar.dart';
import 'package:flutter_application_1/controllers/email_controller.dart';
import 'package:flutter_application_1/controllers/social_controller.dart';
import 'package:flutter_application_1/providers/icon_provider.dart';


import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'ubicacion.dart';



class Social extends StatefulWidget {
  const Social({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState()=>_PageState();
}


class _PageState extends State<Social> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  
  static List cardsUbicar = List.generate(1, (i) => Ubicacion.cardUbicar());
  static List cardsUbicar2 = List.generate(3, (i) => Ubicacion.cardUbicar2());
  static List cardsUbicar3 = List.generate(1, (i) => Ubicacion.title());
  static List cardsActividad = List.of(cardActivity());
  // static List cardsSocial = List.generate(4, (i)=> cardSocialandEstado("SOCIAL"));
  //  static List cardsEstado = List.generate(4, (i)=> cardSocialandEstado("ESTADO"));
  static List cardsSocial = List.of(cardSocialandEstado("SOCIAL"));
  static List cardsEstado = List.of(cardSocialandEstado("ESTADO"));

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
    ListView(
      children: [...cardsUbicar, ...cardsUbicar3, ...cardsUbicar2],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    EmailController emailController=Get.find();
    final pricon=Provider.of<IconDarkTheme>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Social de ${emailController.getEmail.toString()}'),
        actions: <Widget>[
          IconButton(
            icon: pricon.icon,
            onPressed: () {
              setState(() {
                pricon.seticon();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Get.off(const Login());
            },
          ),
        ],
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
    SocialController socialController = Get.find();
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
          onChanged: (valor){
            texto == "SOCIAL" ? socialController.setPublicacionSocial(valor) : socialController.setPublicacionEstado(valor);  
        },
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
    EmailController emailController=Get.find();
    SocialController socialController = Get.find();
    return SizedBox(
      height: 40.0,
      width: 100,
      child:ElevatedButton(
      onPressed: (){
         if (vista == "SOCIAL") {
           Map<String, String> listSocial = {
            "nombreUsuario": emailController.getEmail.toString(),
            "descripcion": socialController.getPublicacionSocial.toString(),
           };
          //  socialController.getDataSocial.insert(socialController.getDataSocial.length, listSocial);
          //  cardsSocial = List.of(cardSocialandEstado("SOCIAL"));
          var c = Obx(()=>Card(
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
                  ListTile(
                    title: Text('${listSocial["nombreUsuario"]}', textAlign: TextAlign.center),
                    subtitle: Text('${listSocial["descripcion"]}'),
                  ),
                ],
              ),
          ));

          cardsSocial.insert(socialController.getDataSocial.length, c);
          cardsSocial.asMap().entries;
          cardsSocial = List.of(cardSocialandEstado("SOCIAL"));
        }else {
          print(vista);
        }
      },
      child: Text(texto)
      ),
    );
  }

static List<Card> cardActivity(){
      SocialController socialController = Get.find();

      List<Card> listCard = [];

      if (socialController.getDataActividad.isNotEmpty) {

        for (var item in socialController.getDataActividad) {

        Card c = Card(
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
                ListTile(
                  title: Text('${item["nombre"]}', textAlign: TextAlign.center),
                  subtitle: Text('${item["descripcion"]}'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Experiencia: ${item["experiencia"]}'
                    ),
                    //const SizedBox(width: 25),
                    Text(
                      'Pago: ${item["pago"]}'
                    ),
                  ],
                ),
              ],
            ),
          );

          listCard.add(c);   
      }
      return listCard;
      }else{
       return listCard = [];
      } 
      
  }

  static List<Card> cardSocialandEstado(String vista){
    SocialController socialController = Get.find();

    List<Card> listCard = [];
    if (vista == "SOCIAL" && socialController.getDataSocial.isNotEmpty) {
      for (var item in socialController.getDataSocial) {
        Card c = Card(
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
              ListTile(
                title: Text('${item["nombreUsuario"]}', textAlign: TextAlign.center),
                subtitle: Text('${item["descripcion"]}'),
              ),
            ],
          ),
        );
        listCard.add(c);
      }
      return listCard;
    }else{
      if (vista == "ESTADO" && socialController.getDataEstados.isNotEmpty) {
        for (var item in socialController.getDataEstados) {
          Card c = Card(
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
                ListTile(
                  title: Text('${item["nombreUsuario"]}', textAlign: TextAlign.center),
                  subtitle: Text('${item["descripcion"]}'),
                ),
              ],
            ),
          );
          listCard.add(c);
        }
        return listCard;
      }else{
        return listCard = [];
      }
    } 
  }

  // static Card cardSocialandEstado(String vista){
  //   if (vista == "SOCIAL") {
  //     return Card(
  //     margin: const EdgeInsets.all(10.0),
  //     elevation: 5.0,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: <Widget>[
  //               TextButton(
  //                 child: const Icon(Icons.colorize_rounded),
  //                 onPressed: () {/* ... */},
  //               ),
  //               const SizedBox(width: 8),
  //             ],
  //           ),
  //           const ListTile(
  //             title: Text('Fulano 1', textAlign: TextAlign.center),
  //             subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis'
  //             'vehicula metus, at lobortis mi. Etiam luctus commodo rhoncus. Maecenas tincidunt elementum libero, eu vestibulum nisi egestas vitae.'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }else{
  //      return Card(
  //     margin: const EdgeInsets.all(10.0),
  //     elevation: 5.0,
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.end,
  //             children: <Widget>[
  //               TextButton(
  //                 child: const Icon(Icons.colorize_rounded),
  //                 onPressed: () {/* ... */},
  //               ),
  //               const SizedBox(width: 8),
  //             ],
  //           ),
  //           const ListTile(
  //             title: Text('Fulano 2', textAlign: TextAlign.center),
  //             subtitle: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer est lacus, tincidunt vitae mi quis'),
  //           ),
  //         ],
  //       ),
  //     );
  //   } 
  // }

    

    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


}