import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:learn_flutter/douban/widgets/dashed_line.dart';
import 'package:learn_flutter/douban/widgets/start_rating.dart';

class CFHomeMovieItem extends StatelessWidget {

  final MovieItem? movie;

  const CFHomeMovieItem({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 8,color: Color(0xffe2e2e2)),///底部灰色分割线
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildHeader(),
          const SizedBox(height: 8,),
          buildContent(),
          const SizedBox(height: 8,),
          buildFooter(),
        ],
      ),
    );
  }

  //1、头部的排名
  Widget buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 238, 205, 144),
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        'No.${movie!.rank}',
        style: const TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 131, 95, 36),
        ),
      ),
    );
  }

  ///2内容的布局
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildContentImage(),
        const SizedBox(width: 8,),
        buildContentInfo(),
        const SizedBox(width: 8,),
        buildContentLine(),
        const SizedBox(width: 8,),
        buildContentWish(),
        const SizedBox(width: 8,),
      ],
    );
  }

  ///2.1内容的图片
  Widget buildContentImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        movie!.imageURL ?? "",
        width: 150,
      ),
    );
  }

  ///2.2内容的信息
  Widget buildContentInfo() {
    return Expanded(///使内容可伸缩
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildContentInfoTitle(),
          buildContentInfoRate(),
          buildContentInfoDesc(),
        ],
      ),
    );
  }

  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          const WidgetSpan(
            child: Icon(Icons.play_circle_outline, color: Colors.redAccent,),
          ),
          TextSpan(
            text: movie!.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: "(${movie!.playDate})",
            style: const TextStyle(fontSize: 18, color: Colors.grey),
          )
        ],
      ),
    );
  }

  Widget buildContentInfoRate() {
    return Row(
      children: <Widget>[
        CFStartRating(rating: movie!.rating ?? 0, size:20,),
        const SizedBox(width: 6,),
        Text('${movie!.rating}', style: const TextStyle(fontSize: 16),),
      ],
    );
  }

  Widget buildContentInfoDesc() {
    //1、字符串拼接
    final generesString = movie!.genres!.join(' ');
    final directorString = movie!.directors!.map((item) => item.name).toList().join(' ');
    final actorString = movie!.casts!.map((item) => item.name).toList().join(' ');

    return Text(
      '$generesString / $directorString / $actorString',
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 16),
    );
  }

  ///2.3内容的分割线
  Widget buildContentLine() {
    return Container(
      height: 100,
      child: CFDashedLine(
        axis: Axis.vertical,
        dashedWidth: 0.5,
        dashedHeight: 6,
        count: 10,
        color: Colors.pink,
      ),
    );
  }

  ///2.4内容的想看
  Widget buildContentWish() {
    return Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const <Widget>[
          Icon(Icons.favorite, color: Color.fromARGB(255, 235, 170, 60),),
          Text('想看',style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 235, 170, 60)),),
        ],
      ),
    );
  }

  ///3、底部
  Widget buildFooter(){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffe2e2e2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        movie!.title ?? '',
        style: const TextStyle(fontSize: 20, color: Color(0xff666666),),
      ),
    );
  }

}