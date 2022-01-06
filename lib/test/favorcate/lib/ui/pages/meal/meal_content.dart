import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:favorcate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/model/category_model.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

class CFMealContent extends StatelessWidget {
  const CFMealContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as CFCategoryModel;
    return Selector<CFMealViewModel, List<MealModel>>(
      selector: (ctx, mealVM){
        ///筛选出符合当前id的数据
        return mealVM.meals.where((element) => element.categories.contains(category.id)).toList();
      },
      ///比较两个数组是否一样，不相同的时候才去重新构建
      shouldRebuild: (last, next) => const ListEquality().equals(last, next),
      builder: (ctx, meals, child){
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index){
            return CFMealItem(meals[index]);
          },
        );
      },
    );
  }
}

// class CFMealContent extends StatelessWidget {
//   const CFMealContent({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final category = ModalRoute.of(context)?.settings.arguments as CFCategoryModel;
//     ///Consumer只要发生改变，就要重新构建
//     return Consumer<CFMealViewModel>(builder: (ctx, mealVM, child) {
//       final meals = mealVM.meals.where((element) => element.categories.contains(category.id)).toList();
//       return ListView.builder(
//         itemCount: meals.length,
//         itemBuilder: (ctx,index){
//           return ListTile(title: Text(meals[index].title),);
//         },
//       );
//     });
//   }
// }
