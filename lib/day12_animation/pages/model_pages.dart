import 'package:flutter/material.dart';

class CFModelPage extends StatelessWidget {
  const CFModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        title: const Text('Model Page'),
      ),
      body: const Center(
        child: Text("ModelPage"),
      ),
    );
  }
}
