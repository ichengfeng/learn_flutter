import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/shared/screen_size.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CFFavorContent extends StatelessWidget {
  const CFFavorContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CFFavorViewModel>(builder: (ctx, favorVM, child) {
      if(favorVM.favorMeals.isEmpty) {
        return Center(child: Text('还没有收藏美食哦', style: TextStyle(fontSize: 24.px),),);
      }
      return ListView.builder(
        itemCount: favorVM.favorMeals.length,
        itemBuilder: (itemCtx, index) {
          return CFMealItem(favorVM.favorMeals[index]);
        },
      );
    });
  }
}
