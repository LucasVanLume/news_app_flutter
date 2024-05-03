import 'package:flutter/material.dart';

class AppTheme {

  static const Color appColor = Color(0xFF0B86E7);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color iconNavBar = Color(0xFF949A9A);
  static const Color inkWellButtom = Color(0xFFF6F5F8);
  static const Color title = Color.fromARGB(255, 85, 85, 85);
  static const Color selectionColor = Color.fromARGB(103, 11, 136, 231);
  static const Color black = Color(0xFF000000);
  static const Color black08 = Color(0xCC000000);
  static const Color black06 = Color(0x99000000);
  static const Color black00 = Color(0x00000000);

  static const MaterialColor appColorSwatch = MaterialColor(0xFF0B86E7, _appColorMap);

  static const Map<int, Color> _appColorMap = {
    50: Color.fromRGBO(11, 134, 231, .1),
    100: Color.fromRGBO(11, 134, 231, .2),
    200: Color.fromRGBO(11, 134, 231, .3),
    300: Color.fromRGBO(11, 134, 231, .4),
    400: Color.fromRGBO(11, 134, 231, .5),
    500: Color.fromRGBO(11, 134, 231, .6),
    600: Color.fromRGBO(11, 134, 231, .7),
    700: Color.fromRGBO(11, 134, 231, .8),
    800: Color.fromRGBO(11, 134, 231, .9),
    900: Color.fromRGBO(11, 134, 231, 1),
  };
}