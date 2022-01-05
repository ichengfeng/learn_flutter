import 'package:flutter/material.dart';
import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/shared/screen_size.dart';

class CFHomCategoryItem extends StatelessWidget {

  final CFCategoryModel category;

  const CFHomCategoryItem(this.category,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Screen.initialize();
    final bgColor = category.backgroundColor;
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12.px),
        gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(0.5),
              bgColor
            ]
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        category.title,
        style: Theme.of(context).textTheme.headline3?.copyWith(
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}
