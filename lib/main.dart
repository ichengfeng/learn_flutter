import 'package:flutter/material.dart';
import 'package:itools/screen_size.dart';
import 'package:itools/log.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent,),
      home: const CFHomePage(),
    );
  }
}

class CFHomePage extends StatelessWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.initialize(standardSize: 750);
    printf('hello world');
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: SizedBox(
        height: 80.px,
        child: const Text('Hello World'),
      ),
    );
  }
}