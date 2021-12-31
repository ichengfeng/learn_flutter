import 'package:flutter/material.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //primaryColor: Colors.orange, //在当前版本中无效失效
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ),
          textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.purple),
            bodyText2: TextStyle(color: Colors.orange),///文本内容的颜色
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData (
            extendedTextStyle: TextStyle(color: Colors.orange),
          )
      ),
      darkTheme: ThemeData(
        primaryColor: Colors.grey,
        textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 20, color: Colors.green),
        ),
      ),
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
        title: const Text("首页"),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Text('add',style: Theme.of(context).textTheme.bodyText1,),
      ),
    );
  }
}