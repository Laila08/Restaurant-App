import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/models/meal_model.dart';
import '../../data/repos/meals_repo.dart';
part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealLoadingState());
  Future<void> getMealData(String categoryName) async {
    emit(MealLoadingState());
    try {
      final List<MealModel> meals = await MealsRepo().getMealByCat(categoryName);
      // final random = Random();
      // final updatedMeals = meals.map((meal) {
      //   final randomPrice = 50 + random.nextInt(71);
      //   return meal.copyWith(price: randomPrice.toDouble());
      // }).toList();
      emit(MealLoadedState(meals));
    } catch (e) {
      emit(MealErrorState(e.toString()));
    }
  }
  void clearResult() {
    emit(MealLoadedState([]));
  }
}

/*
class MealCubit extends Cubit<MealState> {
  MealCubit() : super(MealLoadingState());
  Future<void> getMealData(String categoryName) async {
    try {
      final List<MealModشel> meals = await MealsRepo().getMealByCat(categoryName);
      //final favIds = SpHelper.getFavorites();
      final updatedMeals = await Future.wait(meals.map((meal) async {
       // final isFav = favIds.contains(meal.mealId);
      //  final price = await SpHelper.generateMealPrice(meal.mealId!);
      //  return meal.copyWith(isFav: isFav, price: price);
     }).toList());

      //emit(MealLoadedState(updatedMeals));
   } catch (e) {
      emit(MealErrorState(e.toString()));
    }
  }

  clearResult(){
    emit(MealLoadedState(List<MealModel>.from([])));
  }

  void toggleFavorite(String mealId) async {
    if (state is MealLoadedState) {
      final currentState = state as MealLoadedState;
      final updatedMeals = currentState.meals.map((meal){
        if (meal.mealId == mealId) {
          final newFav = !meal.isFav;
          // حفظ المفضلة في SharedPreferences
          if (newFav) {
              // SpHelper.addFavorite(mealId);
          } else {
              //SpHelper.removeFavorite(mealId);
          }
          return meal.copyWith(isFav: newFav);
        }
        return meal;
      }).toList();

      emit(MealLoadedState(updatedMeals));
    }
  }


}
*/