import 'package:flutter/material.dart';

class CFAppTheme {
  // 1.共有属性
  static const double bodyFontSize = 14;
  static const double smallFontSize = 16;
  static const double normalFontSize = 20;
  static const double largeFontSize = 24;
  static const double xLargeFontSize = 30;

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
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink).copyWith(secondary: Colors.amber),
    canvasColor: const Color.fromRGBO(255, 254, 222, 1),///设置整体默认的背景色
    textTheme: const TextTheme(
      bodyText2: TextStyle(fontSize: bodyFontSize),
      headline4: TextStyle(fontSize: smallFontSize, color: Colors.black87),
      headline3: TextStyle(fontSize: normalFontSize, color: Colors.black87),
      headline2: TextStyle(fontSize: largeFontSize, color: Colors.black87),
      headline1: TextStyle(fontSize: xLargeFontSize, color: Colors.black87),
    ),
  );


  // 3.暗黑模式
  static const Color darkTextColors = Colors.green;

  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    textTheme: const TextTheme(
        bodyText2: TextStyle(fontSize: normalFontSize, color: darkTextColors)
    )
  );
}