import 'package:flutter/material.dart';

class bodySala extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20 / 2),
          decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor),
          child: SafeArea(
            child: Row(
              children: [
                Icon(Icons.mic, color: Colors.purple.withOpacity(0.4)),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20 * 0.75),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(60),
                      ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.attach_file, 
                          color: Colors.purpleAccent.withOpacity(0.3),
                        ),
                        SizedBox(width: 50 / 4),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "I want to say",
                              border: InputBorder.none,
                            ),
                          ),
                          ),
                          Icon(
                          Icons.camera_alt_outlined, 
                          color: Colors.purpleAccent.withOpacity(0.3),
                        ),
                      ],
                      ),  
                  ),
                  )
              ],
              ),
          ),
        ),
      ],
      );
  }
}