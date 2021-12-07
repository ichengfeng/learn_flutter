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
  const CFHomePage({
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: const Text("基础的Widget"),
      ),
      body: const CFHomeContent(),
    );
  }
}

class CFHomeContent extends StatefulWidget {
  const CFHomeContent({
    Key? key
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CFHomeContentState();
  }
}

class _CFHomeContentState extends State<CFHomeContent> {
  @override
  Widget build(BuildContext context) {
    return TextRichDemo();
  }
}

/*富文本处理*/
class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text.rich(
        TextSpan(
            children: [
              TextSpan(text: "葫芦娃",style: TextStyle(color: Colors.red)),
              TextSpan(text: "西游记",style: TextStyle(color: Colors.orange)),
              WidgetSpan(child: Icon(Icons.favorite,color: Colors.red,)),
              TextSpan(text: "黑猫警长",style: TextStyle(color: Colors.green)),
            ]
        )
    );
  }
}

///Text Widget
///TextWidget不是一个可以渲染的Widget
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '落霞与孤鹜齐飞，秋水共长天一色。抚凌云而自惜，奏流水以何惭。冯唐易老，李广难封',
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,//一行展示不完，后面显示。。。
      textScaleFactor: 1.5,
      style: TextStyle(
          color: Colors.red,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
    );
  }
}