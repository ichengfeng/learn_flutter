import 'package:flutter/material.dart';

class CFMinePage extends StatelessWidget {
  const CFMinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
      ),
      body: const Center(
        child: Text('我的内容', style: TextStyle(fontSize: 30, color: Colors.green),),
      ),
    );
  }
}