import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightScaffoldBackground =
      Color.fromARGB(255, 223, 236, 219);
  static final ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: lightScaffoldBackground,
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 24,
          color: Colors.blue,
        ),
        headline2: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ));
}
