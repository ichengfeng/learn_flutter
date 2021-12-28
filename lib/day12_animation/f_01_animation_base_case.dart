import 'dart:ffi';

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

class CFHomePage extends StatefulWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  State<CFHomePage> createState() => _CFHomePageState();
}

class _CFHomePageState extends State<CFHomePage> with SingleTickerProviderStateMixin{

  //1、创建AnimationController
  late AnimationController _controller;
  late CurvedAnimation animation;
  late Animation sizeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      lowerBound: 0,
      upperBound: 1.0,
    );

    //2、设置Curve的值
    animation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    //3、Tween
    sizeAnimation = Tween(begin: 50.0, end: 100.0).animate(animation);

    ///监听动画值的改变
    _controller.addListener(() {
      setState(() {});
    });

    //监听状态的改变
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
        child: Icon(Icons.favorite,color: Colors.red, size: sizeAnimation.value,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.isAnimating) {
            _controller.stop();
          }else {
            _controller.forward();
          }
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/*
 * 1.Animation: 抽象类
 *   *监听动画值的改变
 *   *监听动画状态的改变
 *   *value
 *   *status
 *
 * 2.AnimationController继承自Animation
 *   *vsync：同步信号(this -> with SingleTickerProviderStateMixin)
 *   *forward(): 向前执行动画
 *   *reverse(): 反转执行动画
 *
 * 3.CurveAnimation:
 *   *作用： 设置动画执行的速率（速度曲线）
 *
 * 4.Tween: 设置动画执行的value范围
 *
 *
 *  final controller = AnimationController(vsync: this);
    final animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    final valueAnimation = Tween(begin:100,end:200).animate(controller);
* */
