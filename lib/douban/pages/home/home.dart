import 'package:flutter/material.dart';
import 'home_content.dart';

class CFHomePage extends StatelessWidget {
  const CFHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首页'),
      ),
      body: const CFHomeContent(),
    );
  }
}
