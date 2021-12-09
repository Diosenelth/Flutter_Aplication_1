import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/model/message.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.reference();
  var messages = <Message>[].obs;

  start() {
    databaseReference
        .child("chat")
        .onChildAdded
        .listen(_onEntryAdded);
  }

  stop() {
    databaseReference
        .child("chat")
        .onChildAdded
        .listen(_onEntryAdded)
        .cancel();
  }

  _onEntryAdded(Event event) {
    print("Something was added");
    messages.add(Message.fromSnapshot(event.snapshot));
  }

  Future<void> sendMsg(String text) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    try {
      databaseReference
          .child("chat")
          .push()
          .set({'text': text, 'uid': uid});
    } catch (error) {
      print("Error sending msg");
      return Future.error(error);
    }
  }
}
