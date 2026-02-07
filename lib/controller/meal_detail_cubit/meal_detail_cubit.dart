import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/meal_model.dart';
import '../../data/repos/meals_repo.dart';

part 'meal_detail_state.dart';

class MealDetailCubit extends Cubit<MealDetailState> {
  MealDetailCubit() : super(MealDetailLoadingState());
  Future<void> getMealDetailsById(MealModel meal) async {
    emit(MealDetailLoadingState());
    try {
      final MealDetailModel detail = await MealsRepo().getMealDetailsById(
        meal.mealId,
      );
      final detailWithPrice = detail.copyWith(price: meal.price);
      emit(MealDetailLoadedState(detailWithPrice));
    } catch (e) {
      emit(MealDetailErrorState(e.toString()));
    }
  }
}
