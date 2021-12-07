import 'dart:ui';

import 'package:flutter/material.dart';

main() {
  //1.runApp函数
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('第一个Flutter程序'),
          ),
          body: const Center(
            child: Text(
              'Hello World',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.orange
              ),
            ),
          ),
        ),
      )
  );
}


// //使用MaterialApp风格
// const MaterialApp(
//   home: Center(
//     child: Text(
//       'Hello World',
//       textDirection: TextDirection.ltr,
//       style: TextStyle(
//         fontSize: 30,
//         color: Colors.orange
//       ),
//     ),
//   ),
// )

// const Center(
//   child: Text(
//     'Hello World',
//     textDirection: TextDirection.ltr,
//     style: TextStyle(
//         fontSize: 30,
//         color: Colors.orange
//     ),
//   ),
// )