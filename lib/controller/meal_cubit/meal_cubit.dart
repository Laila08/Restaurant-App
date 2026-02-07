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
      final List<MealModel> meals = await MealsRepo().getMealByCat(
        categoryName,
      );
      emit(MealLoadedState(meals));
    } catch (e) {
      emit(MealErrorState(e.toString()));
    }
  }

  void clearResult() {
    emit(MealLoadedState([]));
  }
}