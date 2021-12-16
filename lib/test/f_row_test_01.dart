import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/untils/log.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
      ),
      home: const CFHomeContent(),
    );
  }
}

class CFHomeContent extends StatelessWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: const ListTest(),
    );
  }
}

class ListTest extends StatelessWidget {
  const ListTest({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (ctx, index) {
      return ListTile(
        title: GestureDetector(
          child: Flexible(
            child: Row(
              children: <Widget>[
                Text(
                  'item=$index',
                  style: const TextStyle(
                    color: Colors.white,backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          onTap: () {
            printf('$index 999999 ===', StackTrace.current);
          },
        ),
      );
    });
  }
}
