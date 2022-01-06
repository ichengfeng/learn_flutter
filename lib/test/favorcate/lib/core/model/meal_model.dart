class CFMealsModel {
  CFMealsModel({
    required this.meals,
  });
  late final List<MealModel> meals;

  CFMealsModel.fromJson(Map<String, dynamic> json){
    meals = List.from(json['meal']).map((e)=>MealModel.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['meal'] = meals.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MealModel {
  MealModel({
    required this.id,
    required this.categories,
    required this.title,
    required this.affordability,
    required this.complexity,
    required this.complex,
    required this.imageUrl,
    required this.duration,
    required this.ingredients,
    required this.steps,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
  });
  late final String id;
  late final List<String> categories;
  late final String title;
  late final int affordability;
  late final int complexity;
  late final String imageUrl;
  late final int duration;
  late final List<String> ingredients;
  late final List<String> steps;
  late final bool isGlutenFree;
  late final bool isVegan;
  late final bool isVegetarian;
  late final bool isLactoseFree;
  String complex = '简单';

  List<String> complexTypes = ['简单','中等','困难'];

  MealModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    categories = List.castFrom<dynamic, String>(json['categories']);
    title = json['title'];
    affordability = json['affordability'];
    complexity = json['complexity'];
    complex = complexTypes[json['complexity']];
    imageUrl = json['imageUrl'];
    duration = json['duration'];
    ingredients = List.castFrom<dynamic, String>(json['ingredients']);
    steps = List.castFrom<dynamic, String>(json['steps']);
    isGlutenFree = json['isGlutenFree'];
    isVegan = json['isVegan'];
    isVegetarian = json['isVegetarian'];
    isLactoseFree = json['isLactoseFree'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['categories'] = categories;
    _data['title'] = title;
    _data['affordability'] = affordability;
    _data['complexity'] = complexity;
    _data['imageUrl'] = imageUrl;
    _data['duration'] = duration;
    _data['ingredients'] = ingredients;
    _data['steps'] = steps;
    _data['isGlutenFree'] = isGlutenFree;
    _data['isVegan'] = isVegan;
    _data['isVegetarian'] = isVegetarian;
    _data['isLactoseFree'] = isLactoseFree;
    return _data;
  }
}