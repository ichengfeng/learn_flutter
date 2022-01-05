import 'package:flutter/material.dart';

class CFFavorScreen extends StatelessWidget {
  const CFFavorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('收藏'),
      ),
      body: const Center(child: Text('收藏')),
    );
  }
}