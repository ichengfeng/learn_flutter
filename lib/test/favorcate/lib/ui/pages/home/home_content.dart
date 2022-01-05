import 'dart:ffi';

import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/home/home_category_item.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:favorcate/ui/shared/log.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';

import 'home_category_item.dart';

class CFHomeContent extends StatelessWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.initialize();
    return FutureBuilder<List<CFCategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(),);
        return GridView.builder(
          padding: EdgeInsets.all(20.px),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.px,
            mainAxisSpacing: 20.px,
            childAspectRatio: 1.5,
          ),
          itemBuilder: (context, index){
            return const CFHomCategoryItem(null);
          },
        );
      },
    );
  }
}