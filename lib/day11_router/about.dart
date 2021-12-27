import 'package:flutter/material.dart';

class CFAboutPage extends StatelessWidget {

  static const String routeName = "/about";

  const CFAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final String message = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('关于'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message),
            ElevatedButton(
              onPressed: () => _backToHome(context),
              child: const Text('返回首页'),),
          ],
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) {
    Navigator.of(context).pop('a about message');
  }
}