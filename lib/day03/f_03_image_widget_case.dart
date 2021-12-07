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

  final imageUrl = "https://ichengfeng.github.io/img/03-02.jpg";

  @override
  Widget build(BuildContext context) {
    return const ImageDemo_02();
  }
}

class ImageDemo_02 extends StatelessWidget {
  const ImageDemo_02({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Image(
      ///1、在Flutter项目中创建一个文件夹，存储图片
      ///2、在pubspec.yaml进行配置
      ///3、使用图片
      image: AssetImage("assets/images/2.jpg"),
    );
  }
}

class ImageDemo_01 extends StatelessWidget {
  const ImageDemo_01({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Image(
      color: Colors.purple,
      colorBlendMode: BlendMode.colorDodge,
      //Image.network(imageURL)
      image:NetworkImage(imageUrl),
      width: 600,
      height: 320,
      fit: BoxFit.contain,
      repeat: ImageRepeat.repeatY,
      //可以自己创建Aliment
      alignment: Alignment.center,
    );
  }
}
