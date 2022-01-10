import 'package:flutter/material.dart';

class CFUnknownPage extends StatelessWidget {
  const CFUnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('错误页面'),
      ),
      body: const Center(
        child: Text('错误页面',style: TextStyle(fontSize: 20, color: Colors.red),),
      ),
    );
  }
}
