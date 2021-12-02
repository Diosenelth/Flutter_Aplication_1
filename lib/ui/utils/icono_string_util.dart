import 'package:flutter/material.dart';

final _icons=<String, IconData>{
  'sunny':Icons.wb_sunny,
  'dark':Icons.dark_mode,
};


String _icon="";
String _icondark="dark";
String _iconsunny="sunny";

Icon getIcon(){
  _icon=_iconsunny;
return Icon(_icons[_iconsunny]);
}

Icon getIconTheme(){
  if (_icon==_iconsunny) {
    _icon=_icondark;
    return Icon(_icons[_icondark]);
  }
  _icon=_iconsunny;
  return Icon(_icons[_icon]);
}