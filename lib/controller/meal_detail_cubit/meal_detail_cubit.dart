import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/utils/app_messages.dart';

import '../../data/models/meal_model.dart';
import '../../data/repos/meals_repo.dart';

part 'meal_detail_state.dart';

class MealDetailCubit extends Cubit<MealDetailState> {
  final MealsRepo mealsRepo;
  MealDetailCubit(this.mealsRepo) : super(MealDetailLoadingState());

  Future<void> getMealDetailsById(MealModel meal) async {
    if (meal.mealId.isEmpty) {
      emit(MealDetailErrorState(AppMessages.mealIdEmpty));
      return;
    }
    emit(MealDetailLoadingState());
    try {
      final detail = await mealsRepo.getMealDetailsById(meal.mealId);
      final detailWithPrice = detail.copyWith(price: meal.price);
      emit(MealDetailLoadedState(detailWithPrice));
    } catch (e) {
      emit(MealDetailErrorState(AppMessages.failedToLoadMealDetails));
    }
  }
}
