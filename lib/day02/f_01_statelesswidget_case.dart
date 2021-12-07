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
      body: const CFHomeContent(),
    );
  }
}

class CFHomeContent extends StatelessWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: const [
        CFHomeProductItem("Aplle1","Macbook1","https://ichengfeng.github.io/img/03-01.jpg"),
        SizedBox(height: 6),
        CFHomeProductItem("Aplle2","Macbook2","https://ichengfeng.github.io/img/03-02.jpg"),
        SizedBox(height: 6),
        CFHomeProductItem("Aplle3","Macbook3","https://ichengfeng.github.io/img/03-03.jpg"),
      ],
    );
  }
}

class CFHomeProductItem extends StatelessWidget {

  final String title;
  final String desc;
  final String imageURL;

  final style1 = const TextStyle(fontSize: 25, color: Colors.orange);
  final style2 = const TextStyle(fontSize: 20, color: Colors.green);

  const CFHomeProductItem(this.title,this.desc,this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          border: Border.all(
              width: 5, //设置边框宽度
              color: Colors.black12 //设置边框颜色
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(title, style: style1),
          const SizedBox(height: 8),
          Text(desc, style: style2),
          const SizedBox(height: 8),
          Image.network(imageURL)
        ],
      ),
    );
  }
}