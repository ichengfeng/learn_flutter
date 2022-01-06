import 'package:favorcate/core/model/meal_model.dart';

import 'network.dart';

class CFMealRequest {
  static Future<List<MealModel>> getMealData() async{
    //1、发送网络请求
    const url = 'meal.json';
    final result = await HttpRequest.request(url);

    //2、json转model
    final mealArray = CFMealsModel.fromJson(result).meals;

    return mealArray;
  }
}