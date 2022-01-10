import 'package:flutter/material.dart';
import 'filter_content.dart';

class CFFilterScreen extends StatelessWidget {

  static const String routeName = '/filter';

  const CFFilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('美食过滤'),
      ),
      body: const CFFilterContent(),
    );
  }
}
