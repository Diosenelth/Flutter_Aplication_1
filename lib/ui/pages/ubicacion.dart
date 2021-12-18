// ignore_for_file: import_of_legacy_library_into_null_safe


import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication_controller.dart';
import 'package:flutter_application_1/controllers/location_controller.dart';
import 'package:flutter_application_1/model/location.dart';
import 'package:flutter_application_1/providers/icon_provider.dart';
import 'package:flutter_application_1/ui/pages/chat_ui.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

LocationController location=Get.find();
AuthenticationController authenticationController = Get.find();
String foto = 'images/AV1.png';
Color color=Colors.white;

class Ubicacion extends StatefulWidget {
  const Ubicacion({Key? key}) : super(key: key);

  @override
  State<Ubicacion> createState() => _UbicacionState();
}

class _UbicacionState extends State<Ubicacion> {

  @override
  void initState() {
    super.initState();
    location.start();
  }

  @override
  void dispose() {
    location.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pricon = Provider.of<IconDarkTheme>(context);
    color=pricon.brightness==Brightness.light ? Colors.white :Colors.black;
    return  loc();
  }


  loc(){
    String email = authenticationController.userEmail();
    return GetX<LocationController>(builder: (controller) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: location.ubicacion.length,
        itemBuilder: (context, index) {
          var element = location.ubicacion[index];
          return _item(element, index, email);
        },
      );
    });
  }


  Widget _item(Location element, int posicion, String email) {
    // logInfo('Current user? -> ${uid == element.user} msg -> ${element.text}');
    return 
      Container(
        margin: const EdgeInsets.all(2),
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius:
            const BorderRadius.all(Radius.circular(30)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 20,
              offset: Offset.zero,
              color: Colors.grey.withOpacity(0.5))
          ]
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(left: 10),
              child: ClipOval(
                child:
                  Image.asset(foto, fit: BoxFit.cover)),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment:
                    CrossAxisAlignment.start,
                  mainAxisAlignment:
                    MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      element.user+":",
                      style:const TextStyle(color: Colors.green),
                        
                    ),
                    Text("Latitud: "+element.latitud),
                    Text("Longitud: "+element.longitud)
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.chat,
                color: Colors.blue,
                size: 30.0,
              ),
              onPressed: () {
                Get.to(
                    const ChatUi()); /*referencia a la pagina del chat*/
              },
            ),
          ],
        ),
    );
  }
}