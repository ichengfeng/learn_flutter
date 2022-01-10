import 'package:favorcate/core/viewmodel/base_view_model.dart';
import 'package:favorcate/core/services/meal_request.dart';

class CFMealViewModel extends CFBaseViewModel {
  CFMealViewModel() {
    CFMealRequest.getMealData().then((value) {
      meals = value;
      notifyListeners();
    });
  }
}