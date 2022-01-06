import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class CFRouter {
  static const String initialRoute = CFMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    CFMainScreen.routeName: (ctx) => const CFMainScreen(),
    CFMealScreen.routeName: (ctx) => const CFMealScreen(),
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}