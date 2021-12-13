import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/service/request/home_request.dart';

class CFHomeContent extends StatefulWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  _CFHomeContentState createState() => _CFHomeContentState();
}

class _CFHomeContentState extends State<CFHomeContent> {

  final List<MovieItem> movies = [];

  @override
  void initState() {
    super.initState();

    //发送网路请求
    // HomeRequest.requestMovieList(0).then((value) {
    //   setState(() {
    //     movies.addAll(value);
    //   });
    // });
    // HomeRequest.getMovieList();

    final rootBundle = DefaultAssetBundle.of(context);
    rootBundle.loadString('assets/data/home.json').then((value) {
      final subjects = json.decode(value);
      for (var sub in subjects) {
        movies.add(MovieItem.fromMap(sub));
      }
      print('=========== $movies.first.title');
    });

  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,//movies.length
      itemBuilder: (ctx, index){
        return ListTile(title: Text('item$index'),);
      },
    );
  }
}
