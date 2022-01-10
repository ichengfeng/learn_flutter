import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'core/viewmodel/filter_view_model.dart';
import 'package:favorcate/ui/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/router/router.dart';

// main() => runApp(const MyApp());

void main() {
  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => CFMealViewModel()),
        ChangeNotifierProvider(create: (context) => CFFavorViewModel()),
        ChangeNotifierProvider(create: (context) => CFFilterViewModel()),
        ChangeNotifierProxyProvider<CFFilterViewModel,CFMealViewModel?>(
          create: (ctx) => CFMealViewModel(),
          update: (ctx, filterVM ,mealVM) {
            mealVM?.updateFilters(filterVM);
            return mealVM;
          },
        ),
      ],
      child: const MyApp(),
    ),
  );
}

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
      onGenerateRoute: CFRouter.generateRoute(),
      onUnknownRoute: CFRouter.unknownRoute(),
      debugShowCheckedModeBanner: false,
    );
  }
}
