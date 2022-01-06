import 'package:favorcate/ui/pages/home/home_content.dart';
import 'package:flutter/material.dart';

class CFHomeScreen extends StatelessWidget {
  const CFHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('美食广场'),
      ),
      body: const CFHomeContent(),
    );
  }
}
