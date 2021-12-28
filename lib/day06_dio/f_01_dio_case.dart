import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:learn_flutter/day07_service/network.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent,),
      home: const CFHomeContent(),
    );
  }
}


class CFHomeContent extends StatefulWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  _CFHomeContentState createState() => _CFHomeContentState();
}

class _CFHomeContentState extends State<CFHomeContent> {

  @override
  void initState() {
    super.initState();

    HttpRequest.request("https://httpbin.org/get", params: {'name':'野猪佩奇'}).then((value) {
      print('network === >>> $value');
    });

  }

  void getTest() {
    final dio = Dio();
    dio.get('https://httpbin.org/get').then((value) {
      print('get === >>> \n $value');
    }).catchError((err){
      print(err);
    }).whenComplete(() {
      print('完成');
    });
  }

  void postTest() {
    final dio = Dio();
    dio.post('https://httpbin.org/post').then((value) {
      print('post === >>> $value');
    }).catchError((err){
      print(err);
    }).whenComplete(() {
      print('完成');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
