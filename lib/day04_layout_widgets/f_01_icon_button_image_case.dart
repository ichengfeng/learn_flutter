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

    return const IconExtensionDemo();
  }
}

class IconExtensionDemo extends StatelessWidget {
  const IconExtensionDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///Icon字体图标和图片图标
    ///1、字体图标矢量图（放大的时候不会失真）
    ///2、字体图标可以设置颜色
    ///3、图标很多时，占据空间更小
    // return const Icon(Icons.pets,size: 300,color: Colors.orange,);
    // return const Icon(IconData(0xe91d,fontFamily: 'MaterialIcons'),size: 300,color: Colors.orange,);
    //1、0xe91d -> unicode编码
    //2、设置对应的字体
    return const Text('\ue91d',style: TextStyle(fontSize: 100,color: Colors.orange,fontFamily: 'MaterialIcons'),);
  }
}

class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    ///1、占位图的问题 FadeImage
    ///2、图片缓存：Flutter会自动对图片进行缓存，已加载的图片会自动缓存到内存中，其他地方调用相同图片时会自动从缓存中取，缓存上限1000张 100M大小
    return FadeInImage(
      fadeOutDuration: const Duration(milliseconds: 1),
      fadeInDuration: const Duration(milliseconds: 1),
      placeholder: const AssetImage('assets/images/1.jpg'),
      image: NetworkImage(imageUrl),
    );
  }
}

class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ///1、默认情况下Button上下有一定的问题
    ///2、如何让button变小：ButtonTheme
    ///取出button的内边距
    return Column(
      children: <Widget>[
        ButtonTheme(
          child: TextButton(
            onPressed:(){},
            child: const Text('Text Button 1',style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(30, 10)),
              padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
              backgroundColor: MaterialStateProperty.all(Colors.red),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),

        TextButton(
          onPressed:(){},
          child: const Text('Text Button 2',style: TextStyle(color: Colors.white),),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
        ),
      ],
    );
  }
}
