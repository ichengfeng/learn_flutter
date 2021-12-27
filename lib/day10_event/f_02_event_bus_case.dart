import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';

/*
* 1、创建一个全局的event_bus对象
* */
final eventBus = EventBus();

class UserInfo {
  String nickname;
  int level;

  UserInfo(this.nickname, this.level);
}

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
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            CFButton(),
            CFText(),
          ],
        ),
      ),
    );
  }
}

class CFButton extends StatelessWidget {
  const CFButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        ///2、发出事件
        final info = UserInfo('ZoomOnePlus', 1);
        eventBus.fire(info);
      },
      child: const Text('按钮'),
    );
  }
}

class CFText extends StatefulWidget {
  const CFText({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CFTextState();
}

class _CFTextState extends State<CFText> {

  String _message = "Hello World";

  @override
  void initState() {
    super.initState();
    ///3、接收发送的信息（监听事件）
    eventBus.on<UserInfo>().listen((event) {
      print(event.nickname);
      setState(() {
        _message = "${event.nickname}-${event.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: const TextStyle(color: Colors.red),);
  }

}