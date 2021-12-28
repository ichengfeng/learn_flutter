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
  final imageUrl = "https://ichengfeng.github.io/img/03-02.jpg";

  final userNameTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ContainerDemo();
  }
}

class ContainerDemo extends StatelessWidget {
  const ContainerDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      // color: Colors.red,
      alignment: const Alignment(-1,-1),//默认值居中
      padding: const EdgeInsets.all(20),//内间距
      margin: const EdgeInsets.all(10),//外间距
      child: const Icon(Icons.pets, size: 50, color: Colors.white,),
      // transform: Matrix4.rotationZ(50),//形态变换
      decoration: BoxDecoration(///添加修饰
        color: Colors.red,///使用decoration的同时，不能在外面设置颜色
        border: Border.all(///设置边框
          width: 5,///边框宽度
          color: Colors.purple,///边框颜色
        ),
        borderRadius: BorderRadius.circular(100),///设置圆角
        boxShadow: const [
          BoxShadow(color: Colors.orange,offset: Offset(10, 10),spreadRadius: 5,blurRadius: 10),
          BoxShadow(color: Colors.blue,offset: Offset(-10, 10),spreadRadius: 5,blurRadius: 10),
        ],///设置阴影
      ),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget> [
        Padding(
          // padding: EdgeInsets.all(8.0),//上下左右都加间距
          // padding: EdgeInsets.symmetric(vertical: 8),//只在垂直方向加间距
          // padding: EdgeInsets.symmetric(horizontal: 8),//只在水平方向加间距
          padding: EdgeInsets.only(bottom: 8),//上下左右的间距任意选择
          child: Text('你好啊，李银河',style: TextStyle(fontSize: 30,backgroundColor: Colors.red),),
        ),
        Text('你好啊，李银河',style: TextStyle(fontSize: 30,backgroundColor: Colors.red),),
        Text('你好啊，李银河',style: TextStyle(fontSize: 30,backgroundColor: Colors.red),),
      ],
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 200,
      // height: 200,
      color: Colors.red,
      child: const Align(
        widthFactor: 10,//宽度放大倍数
        heightFactor: 10,//高度放大倍数
        alignment: Alignment(0, 0),
        child: Icon(Icons.pets,size: 50,),
      ),
    );
  }
}


