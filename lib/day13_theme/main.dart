import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    * 1、一旦设置了主题，那么应用程序中的某些Widget，就会直接使用主题的样式
    * 2、
    * */

    //MaterialColor extends Color
    //父类的引用指向一个子类的对象
    Color color = Colors.red[100]!;

    //子类的引用指向父类的对象 (错的)
    //MaterialColor color = Color（0xff000000）;

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //1、亮度
        brightness: Brightness.light,
        //2、主题色 primarySwatch传入的不是Color，而是MaterialColor
        primarySwatch: Colors.red,
        //3、primaryColor：单独设置导航和Tabbar的颜色
        primaryColor: Colors.orange,
        //4、accentColor: 单独设置FloatingActionButton的颜色
        accentColor: Colors.green,
      ),
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
        title: const Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Hello World'),
            Switch(value: true, onChanged: (value){}),
            CupertinoSwitch(value: true, onChanged: (value){}),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(label: '首页',icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: '分类',icon: Icon(Icons.category)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: const Icon(Icons.add),
      ),
    );
  }
}