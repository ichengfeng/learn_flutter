import 'package:flutter/material.dart';

class CFAppTheme {
  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;

  /*
  * display4 => headline1;
    display3 => headline2;
    display2 => headline3;
    display1 => headline4;
    headline => headline5;
    title    => headline6;
    subhead  => subtitle1;
    subtitle => subtitle2;
    body2    => bodyText1;
    body     => bodyText2;
  * */

  // 2.普通模式
  static const Color norTextColors = Colors.red;

  static final ThemeData norTheme = ThemeData(
    primarySwatch: Colors.pink,
    canvasColor: const Color.fromRGBO(255, 254, 222, 1),///设置整体默认的背景色
    textTheme: const TextTheme(
      bodyText2: TextStyle(fontSize: bodyFontSize),
      headline4: TextStyle(fontSize: smallFontSize, color: Colors.black87),
      headline3: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      headline2: TextStyle(fontSize: largeFontSize, color: Colors.black87),
    )
  );


  // 3.暗黑模式
  static final Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: TextTheme(
        bodyText2: TextStyle(fontSize: normalFontSize, color: darkTextColors)
    )
  );
}