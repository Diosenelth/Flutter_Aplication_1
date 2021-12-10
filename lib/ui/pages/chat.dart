import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/authentication_controller.dart';
import 'package:flutter_application_1/controllers/chat_controller.dart';
import 'package:flutter_application_1/model/message.dart';
import 'package:get/get.dart';
import 'package:prompt_dialog/prompt_dialog.dart';


AuthenticationController authenticationController = Get.find();
late ScrollController _scrollController;
ChatController chatController = Get.find();

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}


class _ChatState extends State<Chat> {
    @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    chatController.start();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    chatController.stop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Social de ${authenticationController.userEmail()}')
      ),
      body:Center(
        child: chat(),
      ),
    );
  }

  TextField textField(String texto) {
    return TextField(
      // controller: TextEditingController()..text = emailController.getEmail,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        labelText: texto,
        suffixIcon: const Icon(Icons.send),
      ),
    );
  }
  chat(){
    String email = authenticationController.userEmail();
    // print('Current user $uid');
    return GetX<ChatController>(builder: (controller) {
      WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
      return ListView.builder(
        itemCount: chatController.messages.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          var element = chatController.messages[index];
          return _item(element, index, email);
        },
      );
    });
  }

  _scrollToEnd() async {
    _scrollController.animateTo(_scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

    Future<void> addBaby(BuildContext context) async {
    getName(context).then((value) {
      chatController.sendMsg(value);
    });
  }

  Future<String> getName(BuildContext context) async {
    String? result = await prompt(
      context,
      title: const Text('Escribir un mensaje'),
      initialValue: '',
      textOK: const Text('Enviar'),
      textCancel: const Text('Cancelar'),
      hintText: 'Mensaje',
      minLines: 1,
      autoFocus: true,
      obscureText: false,
      textCapitalization: TextCapitalization.words,
    );
    if (result != null) {
      return Future.value(result);
    }
    return Future.error('cancel');
  }
    Widget _item(Message element, int posicion, String email) {
    // logInfo('Current user? -> ${uid == element.user} msg -> ${element.text}');
      return Card(
        margin: const EdgeInsets.all(4.0),
        color: email == element.user ? Colors.blue[400] : Colors.grey[500],
        child: ListTile(
          title: Text(
            element.text,
            textAlign: email == element.user ? TextAlign.right : TextAlign.left,
          ),
          subtitle: Text(
            element.user,
            textAlign: email == element.user ? TextAlign.right : TextAlign.left,
          ),
        ),
      );
  }
}