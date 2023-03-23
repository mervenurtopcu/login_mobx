import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  late ThemeData theme;

  DarkTheme() {
    theme = ThemeData(
      brightness: Brightness.dark,
      // primarySwatch: MaterialColor(0xFFFFEB3B , <int,Color>{
      //   50: Color(0xFFFFFDE7),
      //   100: Color(0xFFFFF9C4),
      //   200: Color(0xFFFFF59D),
      //   300: Color(0xFFFFF176),
      //   400: Color(0xFFFFEE58),
      //   500: Color(0xFFFFEB3B),
      //   600: Color(0xFFFDD835),
      //   700: Color(0xFFFBC02D),
      //   800: Color(0xFFF9A825),
      //   900: Color(0xFFF57F17),
      // }),
      appBarTheme: const AppBarTheme(
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          color: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white)
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white12),
          elevation: MaterialStateProperty.all(5),
          textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 20)),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(10.0),
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        iconColor: Colors.black,
        labelStyle: TextStyle(color: Colors.white),
        focusedBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
        floatingLabelStyle: TextStyle(
            color: Colors.white, fontSize: 24,),
      ),
    );
  }
}
