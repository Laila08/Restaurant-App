import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/meal_model.dart';
import '../../data/repos/meals_repo.dart';
import '../../utils/app_messages.dart';
part 'meal_state.dart';

class MealCubit extends Cubit<MealState> {
  final MealsRepo _repo;
  MealCubit(this._repo) : super(MealInitialState());
  Future<void> getMealData(String categoryName) async {
    final trimmed = categoryName.trim();
    if (trimmed.isEmpty) {
      emit(const MealErrorState(AppMessages.invalidCategory));
      return;
    }
    emit(const MealLoadingState());
    try {
      final meals = await _repo.getMealByCat(trimmed);
      if (meals.isEmpty) {
        emit(const MealEmptyState());
        return;
      }
      emit(MealLoadedState(meals));
    } catch (e) {
      emit(const MealErrorState(AppMessages.somethingWentWrong));
    }
  }

  void clearResult() {
    emit(const MealInitialState());
  }
}
