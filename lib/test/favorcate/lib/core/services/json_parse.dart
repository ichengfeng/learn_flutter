import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
class JsonParse {
  static Future<List<CFCategoryModel>> getCategoryData() async {
    ///1、加载json文件
    final jsonString = await rootBundle.loadString('assets/json/category.json');

    ///2.将jsonString转化为map或者List
    final result = json.decode(jsonString);

    ///3.将map中的内容转换一个个的对象
    final resultList = result['category'];
    List<CFCategoryModel> categories = [];
    for(var json in resultList) {
      categories.add(CFCategoryModel.fromJson(json));
    }

    return categories;
  }
}