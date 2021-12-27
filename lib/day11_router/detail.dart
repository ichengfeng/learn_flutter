import 'package:flutter/material.dart';

class CFDetailPage extends StatelessWidget {

  static const String routeName = "/detail";

  final String _message;

  const CFDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      ///当返回为true时，可以自动返回（flutter帮助我们执行返回操作）
      ///当返回为false时，自行写返回代码
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('详情页'),
          // leading: IconButton(
          //   onPressed: ()=>_backToHome(context),
          //   icon: const Icon(Icons.arrow_back_ios),
          // ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_message),
              ElevatedButton(
                onPressed: ()=>_backToHome(context),
                child: const Text('回到首页'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop('a detail message');
  }

}
