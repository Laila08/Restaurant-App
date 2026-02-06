part of 'cart_cubit.dart';

sealed class CartState {
  const CartState();
}

final class CartInitialState extends CartState {}

final class CartUpdatedState extends CartState {
  List<MealModel> mealCarts;
  final Map<String, int> mealCounts;

  CartUpdatedState(this.mealCarts, this.mealCounts);
}
