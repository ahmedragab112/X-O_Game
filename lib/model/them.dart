import 'package:flutter/material.dart';

class MyThemData {
  static const firstPlayerColor = Color(0xffee5e40);
  static const secondPlayerColor = Color(0xff05aca4);
  static const backGroundColor = Color(0xff303d5e);
  static const greenColor = Color(0xff45a14f);
  static ThemeData them = ThemeData(
    scaffoldBackgroundColor: backGroundColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
      bodyMedium: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
      bodySmall: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
