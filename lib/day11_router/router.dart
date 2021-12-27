import 'package:flutter/material.dart';
import '../day11_router/main.dart';
import '../day11_router/about.dart';
import '../day11_router/detail.dart';

class CFRouter {
  static final Map<String, WidgetBuilder>routes = {
    CFHomePage.routeName: (ctx) => const CFHomePage(),
    CFAboutPage.routeName: (ctx) => const CFAboutPage(),
  };

  static const String initialRoute = CFHomePage.routeName;

  static RouteFactory generateRoute(){
    return (settings) {
      if(settings.name == CFDetailPage.routeName) {
        return MaterialPageRoute(builder: (ctx){
          return CFDetailPage(settings.arguments as String);
        });
      }
      return null;
    };
  }
  // static final RouteFactory generateRoute = (settings) {
  //   if(settings.name == CFDetailPage.routeName) {
  //     return MaterialPageRoute(builder: (ctx){
  //       return CFDetailPage(settings.arguments as String);
  //     });
  //   }
  //   return null;
  // };
}