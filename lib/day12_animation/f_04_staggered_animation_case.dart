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
  late Animation colorAnimation;
  late Animation opacityAnimation;
  late Animation radiansAnimation;

  @override
  void initState() {
    super.initState();

    //1、创建controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    //2、设置Curve的值
    animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    ///3、Tween
    ///3.1、创建size的tween
    sizeAnimation = Tween(begin: 10.0, end: 200.0).animate(_controller);
    ///3.2、创建color的tween
    colorAnimation = ColorTween(begin: Colors.orange, end: Colors.purple).animate(_controller);
    ///3.3、创建opacity的tween
    opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    ///3.4、创建radians的tween
    radiansAnimation = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

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
    /*
    * 1、大小的变化
    * 2、颜色的变化
    * 3、透明度变化
    * 4、旋转角度变化
    * */
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),
      body: Center(
        child:AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) {
            return Opacity(///透明度
              opacity: opacityAnimation.value,
              child:Transform(
                transform: Matrix4.rotationZ(radiansAnimation.value),
                alignment: Alignment.center,
                child: Container(
                  width: sizeAnimation.value,
                  height: sizeAnimation.value,
                  color: colorAnimation.value,
                ),
              ),
            );
          },
        ),
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

/*交织动画*/