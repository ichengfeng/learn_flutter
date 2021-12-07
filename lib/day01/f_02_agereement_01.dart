import 'package:flutter/material.dart';
class CFContentBody extends StatelessWidget {

  //错误代码
  var flag = true;

  CFContentBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: flag,
              onChanged: (value) => flag = value!
          ),
          const Text('同意协议', style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}