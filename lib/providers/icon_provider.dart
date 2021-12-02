import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconDarkTheme with ChangeNotifier{

  final _icons=<String, IconData>{
    'sunny':Icons.wb_sunny,
    'dark':Icons.dark_mode,
  };

  Icon _icond=Icon(Icons.wb_sunny);
  Brightness _brightness= Brightness.light;


  final String _icondark="dark";
  final String _iconsunny="sunny";
  String _icon="sunny";


  Icon get icon=>_icond;
  get brightness=>_brightness;


  seticon(){
    if (_icon==_iconsunny) {
      _icon=_icondark;
      _icond=Icon(_icons[_icondark]);
    }else{
      _icon=_iconsunny;
      _icond= Icon(_icons[_iconsunny]);
    }
    _brightness=(_icon==_iconsunny) ? Brightness.light:Brightness.dark;
    notifyListeners();
  }
}