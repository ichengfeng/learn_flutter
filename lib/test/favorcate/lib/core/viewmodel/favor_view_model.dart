import 'package:favorcate/core/model/meal_model.dart';
import 'package:flutter/material.dart';

class CFFavorViewModel extends ChangeNotifier {

  final List<MealModel> _favorMeals = [];

  List<MealModel> get favorMeals => _favorMeals;

  void addMeal(MealModel meal) {
    _favorMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(MealModel meal) {
    _favorMeals.remove(meal);
    notifyListeners();
  }

  bool isFavor(MealModel meal) {
    return _favorMeals.contains(meal);
  }

  void handleMeal(MealModel meal) {
    isFavor(meal) ? removeMeal(meal) : addMeal(meal);
  }
}