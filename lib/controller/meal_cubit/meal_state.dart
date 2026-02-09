part of 'meal_cubit.dart';

@immutable
sealed class MealState {
  const MealState();
}

final class MealInitialState extends MealState {
  const MealInitialState();
}

final class MealLoadingState extends MealState {
  const MealLoadingState();
}

final class MealLoadedState extends MealState {
  final List<MealModel> meals;
  const MealLoadedState(this.meals);
}

final class MealEmptyState extends MealState {
  const MealEmptyState();
}

final class MealErrorState extends MealState {
  final String error;
  const MealErrorState(this.error);
}
