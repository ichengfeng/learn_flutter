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
  _CFHomePageState createState() => _CFHomePageState();
}

class _CFHomePageState extends State<CFHomePage> {
  final ScrollController _controller = ScrollController(initialScrollOffset:300);
  bool _isShowFloatingBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isShowFloatingBtn = _controller.offset >= 1000;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
  * 两种方式可以监听滚动
  * - controller:
  * ----1、可以设置默认值offset
  * ----2、监听滚动，也可以监听滚动的位置
  * - NotificationListener:
  * ----1、监听开始滚动和结束滚动
  * */
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: NotificationListener(///监听
        onNotification: (ScrollNotification notification){
          if (notification is ScrollStartNotification) {
            print('开始滚动');
          } else if (notification is ScrollUpdateNotification){
            print('正在滚动。。。，总滚动的距离${notification.metrics.maxScrollExtent},当前滚动位置：${notification.metrics.pixels}');
          }else if (notification is ScrollEndNotification){
            print('结束滚动');
          }
          return true;
        },
        child: ListView.builder(
          controller: _controller,
          itemBuilder: (BuildContext ctx, int index) {
            return ListTile(
              leading: const Icon(Icons.people),
              trailing: const Icon(Icons.delete),
              title: Text('联系人$index'),
            );
          },
          itemCount: 100,
        ),
      ),
      floatingActionButton: _isShowFloatingBtn ? FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: (){
          _controller.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeIn);
        },
      ) : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}