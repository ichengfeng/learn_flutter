import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/home/home_category_item.dart';
import 'package:favorcate/core/services/json_parse.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:flutter/material.dart';
import 'home_category_item.dart';

///http://123.207.32.32:8001/api/category
class CFHomeContent extends StatelessWidget {
  const CFHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.initialize();
    ///不经常刷新可以这样用(正常场景下要加载多页，设计状态改变，还是用StatefulWidget)
    return FutureBuilder<List<CFCategoryModel>>(
      future: JsonParse.getCategoryData(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const Center(child: CircularProgressIndicator(),);
        if(snapshot.error != null) return const Center(child: Text('请求失败'),);
        final categories = snapshot.data;
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
            return CFHomCategoryItem(categories![index]);
          },
        );
      },
    );
  }
}