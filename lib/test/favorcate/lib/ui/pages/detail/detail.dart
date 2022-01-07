import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:favorcate/ui/pages/detail/detail_content.dart';
import 'package:favorcate/ui/pages/detail/detail_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CFDetailScreen extends StatelessWidget {

  static const String routeName = "/detail";

  const CFDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final meal = ModalRoute.of(context)?.settings.arguments as MealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: CFDetailContent(meal),
      floatingActionButton: CFDetailFloatingButton(meal: meal,),
    );
  }
}
