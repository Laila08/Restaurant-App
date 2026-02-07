part of 'meal_detail_cubit.dart';

@immutable
sealed class MealDetailState {
  const MealDetailState();
}

final class MealDetailLoadingState extends MealDetailState {}

final class MealDetailLoadedState extends MealDetailState {
  final MealModel meal;
  const MealDetailLoadedState(this.meal);
}

final class MealDetailErrorState extends MealDetailState {
  final String error;
  const MealDetailErrorState(this.error);
}
