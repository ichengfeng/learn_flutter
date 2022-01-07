import 'package:favorcate/ui/pages/favor/favor_content.dart';
import 'package:flutter/material.dart';

class CFFavorScreen extends StatelessWidget {
  const CFFavorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('收藏'),
      ),
      body: const Center(
        child: CFFavorContent(),
      ),
    );
  }
}