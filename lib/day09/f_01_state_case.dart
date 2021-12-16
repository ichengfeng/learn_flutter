import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class CFCounterWidget extends InheritedWidget {

  ///1、共享的数据
  final int counter;

  ///2、定义构造方法
  const CFCounterWidget({Key? key, required this.counter,required Widget child}): super (key: key, child: child);

  ///3、获取当前组件最近的当前InheritedWidget
  static CFCounterWidget? of(BuildContext context) {
    ///沿着Element树，去找到最近的CFCounterElement，从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  ///4、决定要不要回调State中的didChangeDependencies
  ///如果返回true：执行依赖当前的InheritedWidget中的didChangeDependencies方法
  @override
  bool updateShouldNotify(covariant CFCounterWidget oldWidget) {
    ///更新时是否要通知
    return oldWidget.counter != counter;
  }

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent,),
      home: CFHomePage(),
    );
  }
}

class CFHomePage extends StatefulWidget {

  CFHomePage({Key? key}) : super(key: key);

  @override
  State<CFHomePage> createState() => _CFHomePageState();
}

class _CFHomePageState extends State<CFHomePage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InferitedWidget"),
      ),
      body: CFCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CFShowData01(),
              CFShowData02(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class CFShowData01 extends StatefulWidget {
  const CFShowData01({Key? key}) : super(key: key);

  @override
  State<CFShowData01> createState() => _CFShowData01State();
}

class _CFShowData01State extends State<CFShowData01> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('执行了didChangeDependencies方法');
  }

  @override
  Widget build(BuildContext context) {

    int counter = CFCounterWidget.of(context)!.counter;

    return Card(
      color: Colors.red,
      child: Text('当前计数：$counter',style: const TextStyle(fontSize: 30),),
    );
  }
}

// class CFShowData01 extends StatelessWidget {
//   const CFShowData01({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     int counter = CFCounterWidget.of(context)!.counter;
//
//     return Card(
//       color: Colors.red,
//       child: Text('当前计数：$counter',style: TextStyle(fontSize: 30),),
//     );
//   }
// }

class CFShowData02 extends StatelessWidget {
  const CFShowData02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int counter = CFCounterWidget.of(context)!.counter;

    return Container(
      color: Colors.blue,
      child: Text('当前计数：$counter',style: const TextStyle(fontSize: 30),),
    );
  }
}
