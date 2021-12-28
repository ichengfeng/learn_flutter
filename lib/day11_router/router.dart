import 'package:flutter/material.dart';
import 'package:learn_flutter/day11_router/unknown.dart';
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

  static RouteFactory unknownRoute() {
    return (settings) {
      return MaterialPageRoute(builder: (ctx) {
        return const CFUnknownPage();
      });
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