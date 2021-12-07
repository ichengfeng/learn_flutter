import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      home: CFHomeDemo(),
    );
  }
}

class CFHomeDemo extends StatefulWidget {
  const CFHomeDemo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  _CFHomeDemoState();
  }
}

class _CFHomeDemoState extends State<CFHomeDemo> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('商品列表'),
      ),
      body: Column(
        children: [
          CFHomeContent()
        ],
      ),
      floatingActionButton: ElevatedButton(
        child: const Icon(Icons.add),
        onPressed: (){
          setState(() {
            // widgets.insert(0, const Text('Hello World'));
          });
        },
      ),
    );
  }
}

class CFHomeContent extends StatefulWidget {
  // const CFHomeContent({Key? key}) : super(key: key);
  CFHomeContent({Key? key}) : super(key: key) {
    print('1、调用CFHomeContent的constructor方法');
  }

  @override
  _CFHomeContentState createState() {
    print('2、调用CFHomeContent的createState方法');
    return _CFHomeContentState();
  }
}

class _CFHomeContentState extends State<CFHomeContent> {

  int _counter = 0;
  _CFHomeContentState() {
    print('3、调用_CFHomeContentState的constructor方法');
  }

  @override
  void initState() {
    final TextStyle style = TextStyle();
    // 这里必须调用super
    super.initState();
    print('4、调用_CFHomeContentState的initState方法');
  }

  @override
  Widget build(BuildContext context) {
    print('5、调用_CFHomeContentState的build方法');
    return Column(
      children: <Widget>[
        ElevatedButton(
          child: const Icon(Icons.add),
          onPressed: (){
            setState(() {
              _counter++;
            });
          },
        ),
        Text('数字：$_counter'),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('5、调用_CFHomeContentState的dispose方法');
  }
}


/*tatelessWidget生命周期 */
// class CFHomeContent extends StatelessWidget {
//
//   final String message;
//
//   const CFHomeContent(this.message, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print('调用build方法');
//     return Text(message);
//   }
// }

