import 'package:flutter/cupertino.dart';

class CFCategoryModel {
  CFCategoryModel({
    required this.id,
    required this.title,
    required this.color,
  });
  late final String id;
  late final String title;
  late final String color;
  late final Color backgroundColor;

  CFCategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    color = json['color'];

    //1、将字符串color转换为16进制的数字
    final colorInt = int.parse(color, radix: 16);
    //2、将透明度加进去
    backgroundColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['color'] = color;
    return _data;
  }
}