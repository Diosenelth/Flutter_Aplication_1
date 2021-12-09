import 'package:flutter/material.dart';
import 'Chaters.dart';


class cardChat extends StatelessWidget {
  const cardChat({
    Key? key, required this.chaters, required this.press,
  }) : super(key: key);

  final Chaters chaters;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 * 0.75,),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 34,
                  backgroundImage: AssetImage(chaters.foto),
                ),
                if(chaters.enActividad)
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      height: 20, 
                      width: 20,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        shape: BoxShape.circle,
                        border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 3)
                      )
                    ),
                  ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chaters.nombre, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    SizedBox(height: 8),
                    Opacity(opacity: 0.33, child: Text(chaters.ultimoMensaje, maxLines: 1, overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
            ),
            Opacity(opacity: 0.64, child: Text(chaters.hora)),
          ],
        ),
      ),
    );
  }
}