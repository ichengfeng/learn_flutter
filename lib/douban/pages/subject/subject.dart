import 'package:flutter/material.dart';

class CFSubjectPage extends StatelessWidget {
  const CFSubjectPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('影音'),
      ),
      body: const Center(
        child: Text('影音内容', style: TextStyle(fontSize: 30, color: Colors.green),),
      ),
    );
  }
}
