import 'package:flutter/material.dart';

class CFMallPage extends StatelessWidget {
  const CFMallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('集市'),
      ),
      body: const Center(
        child: Text('集市内容', style: TextStyle(fontSize: 30, color: Colors.green),),
      ),
    );
  }
}