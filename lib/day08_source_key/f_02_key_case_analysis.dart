import 'dart:math';

import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/untils/log.dart';

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

class CFHomePage extends StatefulWidget {

  const CFHomePage({Key? key}) : super(key: key);

  @override
  State<CFHomePage> createState() => _CFHomePageState();
}

class _CFHomePageState extends State<CFHomePage> {
  final List<String> names = ["aaaa","bbbb","cccc"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: ListView(
        children: names.map((item) {
          return ListItemFul(item,key: ValueKey(item),);
          // return ListItemFul(item,key: UniqueKey());///生成唯一Key
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: (){
          setState(() {
            printf("删除item === ${names.last}", StackTrace.current);
            names.removeAt(0);
          });
        },
      ),
    );
  }
}

class ListItemFul extends StatefulWidget {

  final String name;

  const ListItemFul(this.name, {Key? key}) : super(key: key);

  @override
  State<ListItemFul> createState() => _ListItemLessState();
}

class _ListItemLessState extends State<ListItemFul> {
  final Color randColor = Color.fromARGB(255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.name),
      height: 80,
      color: randColor,
    );
  }
}

