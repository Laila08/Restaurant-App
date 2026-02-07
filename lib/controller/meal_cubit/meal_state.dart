part of 'meal_cubit.dart';

@immutable
sealed class MealState {
  const MealState();
}

final class MealLoadingState extends MealState {}

final class MealLoadedState extends MealState {
  final List<MealModel> meals;
  const MealLoadedState(this.meals);
}

final class MealErrorState extends MealState {
  final String error;
  const MealErrorState(this.error);
}
