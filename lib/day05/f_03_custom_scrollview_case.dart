import 'dart:math';
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
      // appBar: AppBar(
      //   title: const Text("列表测试"),
      // ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,///AppBar是否固定位置
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Hello world'),
              background: Image.asset('assets/images/6.jpg',fit: BoxFit.cover,),
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext ctx, int index) {
                return Container(
                  color: Color.fromARGB(255,Random().nextInt(256),Random().nextInt(256),Random().nextInt(256),),
                );
              },
              childCount: 10,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext ctx, int index) {
                return ListTile(
                  leading: const Icon(Icons.people),
                  trailing: const Icon(Icons.delete),
                  title: Text('联系人$index'),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomScrollView01 extends StatelessWidget {
  const CustomScrollView01({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ///如果没有AppBar，那么内容会被刘海屏的刘海遮挡，这时候要注意
    ///SafeArea：会留出刘海和bottom的位置不能滑动上去
    ///SliverSafeArea： 展示时留出StatusBar和bottom的高度，滑动时可以滑动过去，效果更好
    return CustomScrollView(
      slivers: <Widget>[
        SliverSafeArea(
          sliver: SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 1.5,
              ),
              delegate: SliverChildBuilderDelegate(
                    (BuildContext ctx, int index) {
                  return Container(
                    color: Color.fromARGB(255,Random().nextInt(256),Random().nextInt(256),Random().nextInt(256),),
                  );
                },
                childCount: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}