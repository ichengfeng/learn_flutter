import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: const Text("基础的Widget"),
      ),
      body: const CFHomeContent(),
    );
  }
}

class CFHomeContent extends StatefulWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CFHomeContentState();
  }
}

class _CFHomeContentState extends State<CFHomeContent> {

  @override
  Widget build(BuildContext context) {

    final kScreenWidth = MediaQuery.of(context).size.width;///当前屏幕宽度
    final kScreenHeight = MediaQuery.of(context).size.height;///当前屏幕高度
    print("当前屏幕宽: $kScreenWidth,高度: $kScreenHeight");

    return RowDemo2();
  }
}

///拓展
class RowDemo2 extends StatelessWidget {
  const RowDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset('assets/images/7.jpg',),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            // width: double.infinity,
            // alignment: AlignmentDirectional.center,
            padding: const EdgeInsets.all(8),
            color: const Color.fromARGB(100, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('宁静的早晨',style: TextStyle(color: Colors.white, fontSize: 20),),
                GestureDetector(
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onTap: () {
                    print("收藏");
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StackDemo1 extends StatelessWidget {
  const StackDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /*
    * Stack默认大小是包裹内容的
    * -alignment: 从什么位置开始排布所有的子Widget
    * -fit: expand（很少） 将子元素拉伸到尽可能大
    * -overflow: 超出部分如何处理
    *
    * Positioned: Widget定位
    * */

    return Stack(///按顺序层叠展示
      alignment: AlignmentDirectional.bottomStart,
      children: <Widget>[
        Image.asset('assets/images/7.jpg', fit: BoxFit.cover,),
        Container(width: 150,height: 150,color: Colors.red,),
        const Positioned(
          right: 30,
          bottom: 20,
          child: Text('夕阳西下'),
        ),
      ],
    );
  }
}


