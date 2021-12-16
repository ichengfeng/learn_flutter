import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent,),
      home: CFHomePage(),
    );
  }
}

class CFHomePage extends StatelessWidget {

  CFHomePage({Key? key}) : super(key: key);

  final GlobalKey<_CFHomeContentState> homeKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: CFHomeContent(key: homeKey,),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.gesture),
        onPressed: (){
          print(homeKey.currentState!.message);
          print(homeKey.currentState!.widget.name);
        },
      ),
    );
  }
}

class CFHomeContent extends StatefulWidget {

  const CFHomeContent({Key? key}) : super(key: key);

  final String name = 'ichengfeng';

  @override
  _CFHomeContentState createState() => _CFHomeContentState();
}

class _CFHomeContentState extends State<CFHomeContent> {

  final String message = 'fltter123';

  @override
  Widget build(BuildContext context) {
    return Text(message);
  }
}
