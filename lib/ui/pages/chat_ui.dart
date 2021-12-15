import 'package:flutter/material.dart';
import 'package:flutter_application_1/ui/pages/chat.dart';

void chatUiApp() => runApp(const ChatUi());

class ChatUi extends StatelessWidget {
  const ChatUi({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Scaffold(
      body:Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child:Container(
              padding: const EdgeInsets.only(bottom: 60),
              child: const Chat(),
            )
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  Expanded(
                    child: TextField(
                      controller: myController,
                      style: const TextStyle(color: Colors.blue),
                      decoration: const InputDecoration(
                        hintText: "Escribir mensaje...",
                        hintStyle: TextStyle(color: Colors.black54),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15,),
                  FloatingActionButton(
                    onPressed: (){
                      FocusScope.of(context).requestFocus(FocusNode());
                      chatController.sendMsg(myController.text);
                      myController.text="";
                      },
                    child: const Icon(Icons.send,color: Colors.white,size: 18,),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
                
              ),
            ),
          ),
        ],)
    );

    
  }
}