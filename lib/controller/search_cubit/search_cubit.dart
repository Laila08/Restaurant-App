import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/meal_model.dart';
import '../../../data/repos/meals_repo.dart';
import '../../utils/app_messages.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final MealsRepo mealsRepo;
  SearchCubit(this.mealsRepo) : super(SearchInitState());

  Future<void> searchMeals(String mealName) async {
    if (mealName.trim().isEmpty) {
      emit(SearchLoadedState([], false));
      return;
    }
    emit(SearchInitState());
    try {
      final List<MealModel> meals = await mealsRepo.searchMeals(mealName);
      emit(SearchLoadedState(meals, meals.isNotEmpty));
    } catch (e) {
      emit(SearchErrorState(AppMessages.searchError));
    }
  }

  void clearResult() {
    emit(SearchLoadedState([], false));
  }
}
