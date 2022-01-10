import 'package:favorcate/core/router/unknown.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:favorcate/ui/pages/filter/filter_content.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';

class CFRouter {
  static const String initialRoute = CFMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    CFMainScreen.routeName: (ctx) => const CFMainScreen(),
    CFMealScreen.routeName: (ctx) => const CFMealScreen(),
    CFDetailScreen.routeName: (ctx) => const CFDetailScreen(),
  };

  // 自己扩展
  static RouteFactory generateRoute() {
    return (settings) {
      if(settings.name == CFFilterScreen.routeName){
        return MaterialPageRoute(
          builder: (ctx) {
            return const CFFilterScreen();
          },
          fullscreenDialog: true,
        );
      }
      return null;
    };
  }

  static RouteFactory unknownRoute() {
    return (settings) {
      return MaterialPageRoute(
        builder: (ctx){
          return const CFUnknownPage();
        },
      );
    };
  }
}