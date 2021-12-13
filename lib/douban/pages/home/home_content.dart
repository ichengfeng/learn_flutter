import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/douban/pages/home/home_movie_item.dart';
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

    DefaultAssetBundle.of(context).loadString('assets/data/home.json').then((value) {
      final subjects = json.decode(value);
      List list = subjects['subjects'];
      for (var sub in list) {
        movies.add(MovieItem.fromMap(sub));
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,//movies.length
      itemBuilder: (ctx, index){
        return CFHomeMovieItem(movie: movies[index],);
      },
    );
  }
}
