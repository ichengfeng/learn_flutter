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

class CFHomePage extends StatelessWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GestureDetector(
              onTapDown: (details){
                print('outer click');
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.blue,
                alignment: Alignment.center,
              ),
            ),
            IgnorePointer(///忽略里面的手势
              child: GestureDetector(
                onTapDown: (details){
                  print('inner click');
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GestureDetectorTest extends StatelessWidget {
  const GestureDetectorTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(///手势侦测
      onTapDown: (details){
        print('按下 ${details.localPosition}');
      },
      onTapUp: (details){
        print('抬起 ${details.localPosition}');
      },
      onTap: (){
        print('点击');
      },
      onDoubleTap: (){
        print('双击');
      },
      onLongPress: (){
        print('长按');
      },
      onTapCancel: (){
        print('点击取消');
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
      ),
    );
  }
}

class ListenerTest extends StatelessWidget {
  const ListenerTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Listener(///点击事件监听
      onPointerDown: (event) {
        print('指针按下：${event.position} localOffset = ${event.localPosition}');
      },
      onPointerMove: (event) {
        print('指针移动：${event.position} localOffset = ${event.localPosition}');
      },
      onPointerUp: (event) {
        print('指针抬起：${event.position} localOffset = ${event.localPosition}');
      },
      onPointerCancel: (event) {
        print('指针取消：${event.position} localOffset = ${event.localPosition}');
      },
      child: Container(
        width: 200,
        height: 200,
        color: Colors.red,
      ),
    );
  }
}