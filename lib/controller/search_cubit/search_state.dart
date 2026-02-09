part of 'search_cubit.dart';

sealed class SearchState {}

final class SearchInitState extends SearchState {}

final class SearchLoadedState extends SearchState {
  List<MealModel> meals;
  bool showResults = false;
  SearchLoadedState(this.meals, this.showResults);
}

final class SearchErrorState extends SearchState {
  String errorMsg;
  SearchErrorState(this.errorMsg);
}
