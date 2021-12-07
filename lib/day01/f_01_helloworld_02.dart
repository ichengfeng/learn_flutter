import 'package:flutter/material.dart';

// main {
//   runApp(const CFHomePage());
// }

main() => runApp(const MyApp());

/// Widget;
/// 有状态的Widget: StatefulWidget 在运行过程中有一些状态（data）需要改变
/// 无状态的Widget: StatelessWidget 内容是确定没有状态（data）的改变

///1、最终行程的是一个widget树
///2、组件化开发的实现

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CFHomePage(),
    );
  }
}

class CFHomePage extends StatelessWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text('第一个Flutter程序'),
        ),
        body: const CFContentBody()
    );
  }
}

class CFContentBody extends StatelessWidget {
  const CFContentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text(
        'Hello World',
        style: TextStyle(
            fontSize: 30,
            color: Colors.orange
        ),
      ),
    );
  }
}