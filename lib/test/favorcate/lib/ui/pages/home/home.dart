import 'package:favorcate/ui/pages/home/home_content.dart';
import 'package:flutter/material.dart';
import 'home_app_bar.dart';
import 'home_drawer.dart';

class CFHomeScreen extends StatelessWidget {
  const CFHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CFHomeAppBar(context),
      body: const CFHomeContent(),
      drawer: const CFHomeDrawer(),
    );
  }
}
