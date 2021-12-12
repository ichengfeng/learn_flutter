import 'package:flutter/material.dart';

class CFHomeContent extends StatefulWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  _CFHomeContentState createState() => _CFHomeContentState();
}

class _CFHomeContentState extends State<CFHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('首页内容', style: TextStyle(fontSize: 30, color: Colors.green),),
    );
  }
}
