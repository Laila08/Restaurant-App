import 'package:food_delivery/utils/api_path.dart';
import 'package:food_delivery/utils/app_messages.dart';

import '../models/meal_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MealsRepo {
  Future<List<MealModel>> getMealByCat(String mealName) async {
    final response = await http.get(Uri.parse(ApiPath.getMealPath(mealName)));

    if (response.statusCode == 200) {
      final dataMapFromApi = json.decode(response.body);
      final mealsListInMap = List.from(dataMapFromApi['meals'] ?? []);

      return mealsListInMap
          .where(
            (json) =>
                json['idMeal'] != null &&
                json['strMeal'] != null &&
                json['strMealThumb'] != null,
          )
          .map((json) => MealModel.fromJson(json))
          .toList();
    } else {
      throw Exception(AppMessages.searchError);
    }
  }

  Future<MealDetailModel> getMealDetailsById(String mealId) async {
    final response = await http.get(
      Uri.parse(ApiPath.getMealDetailsPath(mealId)),
    );

    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      final mealList = dataMap['meals'];

      if (mealList != null && mealList.isNotEmpty) {
        return MealDetailModel.fromJson(mealList[0]);
      } else {
        throw Exception(AppMessages.mealNotFound);
      }
    } else {
      throw Exception(AppMessages.failedToLoadMealDetails);
    }
  }

  Future<List<MealModel>> searchMeals(String mealName) async {
    final response = await http.get(Uri.parse(ApiPath.getMealPath(mealName)));
    if (response.statusCode == 200) {
      final dataMap = json.decode(response.body);
      final mealList = dataMap['meals'];

      if (mealList != null && mealList.isNotEmpty) {
        return mealList
            .where(
              (json) =>
                  json['idMeal'] != null &&
                  json['strMeal'] != null &&
                  json['strMealThumb'] != null,
            )
            .map<MealModel>((json) => MealModel.fromJson(json))
            .toList();
      } else {
        return [];
      }
    } else {
      throw Exception(AppMessages.failedToLoadMealDetails);
    }
  }
}
