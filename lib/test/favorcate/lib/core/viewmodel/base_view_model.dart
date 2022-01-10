import 'package:flutter/material.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';

class CFBaseViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  late CFFilterViewModel _filterVM;

  void updateFilters(CFFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<MealModel> get meals {
    return _meals.where((meal) {
      //过滤
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<MealModel> get originMeals {
    return _meals;
  }

  set meals(List<MealModel> value) {
    _meals = value;
    notifyListeners();
  }
}