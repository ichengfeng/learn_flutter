import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
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
        title: const Text('商品列表'),
      ),
      body: const CFHomeContent('2021年12月1日 杭州天气不错呀'),
    );
  }
}

class CFHomeContent extends StatefulWidget {

  final String message;

  const CFHomeContent(this.message, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CFHomeContentState();
  }
}

///为什么FLutter在设计的时候StatefulWidget的build方法放在State中
///1、build出来的Widgets是需要依赖State中的变量（状态/数据）
///2、在编程过程中，Flutter的运行过程中，
///   Widget是不断的销毁和创建的
///   当我们的状态发生改变时，并不希望重新生成一个新的State
class _CFHomeContentState extends State<CFHomeContent> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _getButtons(),
          Text('当前计数：$_counter',style: const TextStyle(
              fontSize: 30,
              color: Colors.red
          )),
          Text(widget.message)
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
              child: const Text('+',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.pink),
              ),
              onPressed: (){
                setState(() {
                  _counter++;
                });
              }
          ),
          ElevatedButton(
              child: const Text('-',style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
              ),),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.purple)
              ),
              onPressed: (){
                setState(() {
                  _counter--;
                });
              }
          )
        ],
    );
  }
}