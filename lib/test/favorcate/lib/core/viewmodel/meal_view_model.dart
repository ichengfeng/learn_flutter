import 'package:flutter/material.dart';
import 'package:favorcate/core/services/meal_request.dart';
import 'package:favorcate/core/model/meal_model.dart';

class CFMealViewModel extends ChangeNotifier {
  List<MealModel> _meals = [];

  List<MealModel> get meals => _meals;

  CFMealViewModel() {
    CFMealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}