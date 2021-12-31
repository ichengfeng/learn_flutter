import 'package:flutter/material.dart';
import 'package:learn_flutter/day14_screen_fit/shared/screen_size.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///初始化
    Screen.initiallize(standardSize: 750);

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

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final statusHeight = MediaQuery.of(context).padding.top;
    print('状态栏高度：$statusHeight, 宽=$width,高=$height');
    print(Screen.screenWidth);

    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
        child: Container(
          width: 200.px,
          height: 200.px,
          color: Colors.grey,
          alignment: Alignment.center,
          child: Text("Hello World",style: TextStyle(fontSize: 20.px),),
        ),
      ),
    );
  }
}