import 'package:flutter/material.dart';

class CFHomeAppBar extends AppBar {
  CFHomeAppBar(BuildContext context, {Key? key}) : super (
    key: key,
    centerTitle: true,
    title: const Text('美食广场'),
    leading: Builder(
      builder: (ctx) {
        return IconButton(///给Drawer入口替换图标
          icon: const Icon(Icons.settings),
          onPressed: () {
            Scaffold.of(ctx).openDrawer();
          },
        );
      },
    ),
  );
}
