import "package:flutter/material.dart";

class chatApp extends StatefulWidget {
  chatApp({Key? key}) : super(key: key);

  @override
  _chatAppState createState() => _chatAppState();
}

class _chatAppState extends State<chatApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.grey),
          onPressed: () { Navigator.of(context).pop();},
        )
      ),


    );
  }
}