import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal_content.dart';
import 'package:flutter/material.dart';

class CFMealScreen extends StatelessWidget {

  static const String routeName = '/meal';

  const CFMealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final category = ModalRoute.of(context)?.settings.arguments as CFCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: const CFMealContent(),
    );
  }
}
