import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CFDetailFloatingButton extends StatelessWidget {

  final MealModel meal;

  const CFDetailFloatingButton({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CFFavorViewModel>(
      builder: (ctx, favorVM, child){
        //1、判断是否是收藏状态
        final iconData = favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
        final iconColor = favorVM.isFavor(meal) ? Colors.red : Colors.black;
        return FloatingActionButton(
          child: Icon(iconData, color: iconColor,),
          onPressed: () {
            favorVM.handleMeal(meal);
          },
        );
      },
    );
  }
}
