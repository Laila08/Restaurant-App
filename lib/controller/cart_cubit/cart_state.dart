part of 'cart_cubit.dart';

sealed class CartState {
  const CartState();
}

final class CartInitialState extends CartState {}

final class CartLoadingState extends CartState {}

final class CartErrorState extends CartState {
  final String error;

  CartErrorState({required this.error});
}

final class CartUpdatedState extends CartState {
  List<MealModel> mealCarts;
  final Map<String, int> mealCounts;

  CartUpdatedState(this.mealCarts, this.mealCounts);
}
