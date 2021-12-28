import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: const CFHomeContent(),
    );
  }
}

///1、ListView: 列表
///- 默认构造方法（ListView（0））
///- ListView.build()
///- ListView.separated
///- ListView.custom
///
///
///2、GridView: 网格
///3、Sliver：
///4、滚动的监听

class CFHomeContent extends StatelessWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.separated(///不能设定固定高度，自适应高度
        itemBuilder: (BuildContext ctx, int index) {
          return Text(
            'Hello World: $index',
            style: const TextStyle(fontSize: 20,),
          );
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return const Divider(
            color: Colors.red,
            height: 30,//应该是分割线所在区域的高度
            indent: 30,//分割线距离左边的距离
            endIndent: 30,//分割线距离右边的距离
            thickness: 10,//设置分割线的高度
          );
        },
        itemCount: 100,
      ),
    );
  }
}

///ListView-build构造器 即将出现时才去渲染数据，调用回调函数
///不能设定固定高度，自适应高度
class ListViewDemo02 extends StatelessWidget {
  const ListViewDemo02({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext ctx, int index){
        return Text('Hello World: $index',style: const TextStyle(fontSize: 20),);
      },
    );
  }
}

///ListView-默认构造器
class ListViewDemo01 extends StatelessWidget {
  const ListViewDemo01({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.vertical,//滚动方向
      // reverse: true,//列表反转
      // itemExtent: 100,//每行的固定高度
      children: List.generate(100, (index) {
        return ListTile(
          leading: const Icon(Icons.people),
          trailing: const Icon(Icons.delete),
          title: Text('联系人${index+1}'),
          subtitle: const Text('联系电话：16688889999'),
        );
      }),
    );
  }
}





