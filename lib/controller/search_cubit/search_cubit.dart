import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/meal_model.dart';
import '../../../data/repos/meals_repo.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(searchInitState());
  Future<void> searchMeals(String mealName) async {
    try {
      final List<MealModel> meals = await MealsRepo().searchMeals(mealName);
      if (meals.isNotEmpty) {
        emit(SearchLoadedState(meals, true));
      } else {
        emit(SearchLoadedState([], false));
      }
    } catch (e) {
      emit(searchErrorState(e.toString()));
    }
  }
  void clearResult(){
    emit(SearchLoadedState(List<MealModel>.from([]),false));
  }
}
