import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'core/router/router.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '美食广场',
      theme: CFAppTheme.norTheme,
      ///配置路由
      initialRoute: CFRouter.initialRoute,
      routes: CFRouter.routes,
      onGenerateRoute: CFRouter.generateRoute,
      onUnknownRoute: CFRouter.unknownRoute,
    );
  }
}
