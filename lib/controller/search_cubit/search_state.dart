part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class searchInitState extends SearchState {
  // TODO: implement props
  List<Object?> get props => [];
}


final class SearchLoadedState extends SearchState {
  List<MealModel> meals;
  bool showResults = false;
  SearchLoadedState(this.meals, this.showResults);

  @override
  // TODO: implement props
  List<Object?> get props => [meals, showResults];
}
final class searchErrorState extends SearchState {
  String erroeMsg;
  searchErrorState(this.erroeMsg);

  @override
  // TODO: implement props
  List<Object?> get props => [erroeMsg];
}