import '../models/meal_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MealsRepo {
  Future<List<MealModel>> getMealByCat(String mealName) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=$mealName'));

    if (response.statusCode == 200) {
      final dataMapFromApi = json.decode(response.body);
      final mealsListInMap = List.from(dataMapFromApi['meals'] ?? []);

      return mealsListInMap
          .where((json) =>
      json['idMeal'] != null &&
          json['strMeal'] != null &&
          json['strMealThumb'] != null)
          .map((json) => MealModel.fromJson(json)) // ✅ هنا يستخدم fromJson
          .toList();
    } else {
      throw Exception('Failed to search meals');
    }
  }


  Future<MealDetailModel> getMealDetailsById(String mealId) async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      final mealList = dataMap['meals'];

      if (mealList != null && mealList.isNotEmpty) {
        return MealDetailModel.fromJson(mealList[0]);
      } else {
        throw Exception('Meal not found');
      }
    } else {
      throw Exception('Failed to load meal details');
    }
  }
/*
  Future<List<MealDetailModel>> searchMeals(String mealName) async {
    final response = await http.get(
      Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/search.php?s=$mealName'),
    );
    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      final mealList = dataMap['meals'];

      if (mealList != null && mealList.isNotEmpty) {
        return mealList
            .map<MealModel>((json) => MealModel.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load meal details');
    }
  }*/
  Future<List<MealModel>> searchMeals(String mealName) async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=$mealName'),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      final mealList = dataMap['meals'];

      if (mealList != null && mealList.isNotEmpty) {
        return mealList
            .where((json) =>
        json['idMeal'] != null &&
            json['strMeal'] != null &&
            json['strMealThumb'] != null)
            .map<MealModel>((json) => MealModel.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } else {
      throw Exception('Failed to load meal details');
    }
  }

}
