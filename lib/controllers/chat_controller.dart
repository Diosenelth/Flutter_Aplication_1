// ignore_for_file: avoid_print

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_application_1/model/message.dart';
import 'package:get/get.dart';

import 'authentication_controller.dart';

class ChatController extends GetxController {
  final databaseReference = FirebaseDatabase.instance.reference();
  var messages = <Message>[].obs;
  AuthenticationController authenticationController = Get.find();


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
        messages.clear();
  }

  _onEntryAdded(Event event) {
    // print("Something was added");
    messages.add(Message.fromSnapshot(event.snapshot));
  }

  Future<void> sendMsg(String text) async {
    String email = authenticationController.userEmail();
    try {
      databaseReference
          .child("chat")
          .push()
          .set({'text': text, 'email': email});
    } catch (error) {
      print("Error sending msg");
      return Future.error(error);
    }
  }
}
