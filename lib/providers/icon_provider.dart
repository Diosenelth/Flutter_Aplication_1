import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconDarkTheme with ChangeNotifier{

  final _icons=<String, IconData>{
    'sunny':Icons.wb_sunny,
    'dark':Icons.dark_mode,
  };

  Icon _icond=Icon(Icons.wb_sunny);

  String _icon="";
  String _icondark="dark";
String _iconsunny="sunny";

  Icon get icon=>_icond;


  seticon(){
    if (_icon==_iconsunny) {
      _icon=_icondark;
      _icond=Icon(_icons[_icondark]);
    }else{
      _icon=_iconsunny;
      _icond= Icon(_icons[_icon]);
    }
    notifyListeners();
  }
}