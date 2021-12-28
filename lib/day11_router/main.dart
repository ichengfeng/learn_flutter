import 'package:flutter/material.dart';
import 'package:learn_flutter/day11_router/detail.dart';
import 'package:learn_flutter/day11_router/router.dart';
import 'about.dart';
import 'unknown.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent,),
      routes: CFRouter.routes,
      // home: const CFHomePage(),
      initialRoute: CFRouter.initialRoute,
      onGenerateRoute: CFRouter.generateRoute(),
      onUnknownRoute: CFRouter.unknownRoute(),
    );
  }
}

class CFHomePage extends StatefulWidget {

  static const String routeName = "/";

  const CFHomePage({Key? key}) : super(key: key);

  @override
  State<CFHomePage> createState() => _CFHomePageState();
}

class _CFHomePageState extends State<CFHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _jumpToDetail(context),
              child:const Text('跳转到详情',style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
              onPressed: () => _jumpToAbout(context),
              child:const Text('跳转到关于',style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
              onPressed: () => _jumpToDetail2(context),
              child:const Text('跳转到详情2',style: TextStyle(fontSize: 20),),
            ),
            ElevatedButton(
              onPressed: () => _jumpToSettings(context),
              child:const Text('跳转到设置',style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }

  void _jumpToDetail(BuildContext context){
    Future future = Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
      ///1、普通的跳转方式
      ///传递参数胡：通过构造器直接传
      return const CFDetailPage('a home message');
    }));

    future.then((value) {
      print(value);
    });
  }

  void _jumpToAbout(BuildContext context){
    Navigator.of(context).pushNamed(CFAboutPage.routeName, arguments: 'a home message');
  }

  void _jumpToDetail2(BuildContext context){
    Navigator.of(context).pushNamed(CFDetailPage.routeName, arguments: 'a home message aaa');
  }

  void _jumpToSettings(BuildContext context) {
    Navigator.of(context).pushNamed('/settings');
  }

}