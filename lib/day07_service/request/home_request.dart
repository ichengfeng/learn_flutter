import 'package:flutter/services.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/day07_service/config.dart';
import 'package:learn_flutter/day07_service/network.dart';

class HomeRequest {

  static Future requestMovieList(int start) async{

    //1、构建URL
    final movieURL = 'movie/top250?start=$start&count=${HomeConfig.movieCount}';

    //2、发送网络请求获取结果
    final result = await HttpRequest.request(movieURL);
    final subjects = result['subject'];

    //3、将Map转成Model
    List<MovieItem> movies = [];
    for (var sub in subjects) {
      movies.add(MovieItem.fromMap(sub));
    }
    return movies;
  }

  static void getMovieList() {
    List<MovieItem> movies = [];

    final json = rootBundle.load('assets/data/home.json').then((value) {
      print('======= >>>>>> $value');
    });
  }

}