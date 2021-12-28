import 'dart:math';
import 'package:flutter/material.dart';

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

///2、GridView: 网格(类似Collection)
///

class CFHomePage extends StatelessWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,//item的宽高比
            crossAxisSpacing: 8,//交叉轴方向间距
            mainAxisSpacing: 8,//主轴方向间距
          ),
          itemBuilder: (BuildContext ctx, int index) {
            return Container(
              color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
            );
          },
        ),
      ),
    );
  }
}

class GridViewDemo2 extends StatelessWidget {
  const GridViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 140,//最大宽度
        childAspectRatio: 0.8,//item的宽高比
        crossAxisSpacing: 8,//交叉轴方向间距
        mainAxisSpacing: 8,//主轴方向间距
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}

class GridViewDemo1 extends StatelessWidget {
  const GridViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,//交叉轴方向item数量
        childAspectRatio: 0.8,//item的宽高比
        crossAxisSpacing: 8,//交叉轴方向间距
        mainAxisSpacing: 8,//主轴方向间距
      ),
      children: List.generate(100, (index) {
        return Container(
          color: Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256)),
        );
      }),
    );
  }
}