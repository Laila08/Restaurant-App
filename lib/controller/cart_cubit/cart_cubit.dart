import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/meal_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final List<MealModel> _myCarts = [];
  final Map<String, int> _mealCounts = {};

  CartCubit() : super(CartInitialState());

  List<MealModel> get myCarts => List.unmodifiable(_myCarts);
  Map<String, int> get mealCounts => Map.unmodifiable(_mealCounts);
  void _emitUpdated() {
    emit(
      CartUpdatedState(
        mealCarts: List.unmodifiable(_myCarts),
        mealCounts: Map.unmodifiable(_mealCounts),
      ),
    );
  }

  void addToCart(MealModel meal) {
    try {
      final index = _myCarts.indexWhere((m) => m.mealId == meal.mealId);

      if (index == -1) {
        _myCarts.add(meal);
        _mealCounts[meal.mealId] = 1;
      } else {
        _mealCounts[meal.mealId] = (_mealCounts[meal.mealId] ?? 0) + 1;
      }
      _emitUpdated();
    } on Exception catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }

  void removeFromCart(String mealId) {
    _myCarts.removeWhere((meal) => meal.mealId == mealId);
    _mealCounts.remove(mealId);
    _emitUpdated();
  }

  void incrementMeal(String mealId) {
    if (!_mealCounts.containsKey(mealId)) return;
    _mealCounts[mealId] = _mealCounts[mealId]! + 1;
    _emitUpdated();
  }

  void decrementMeal(String mealId) {
    if (!_mealCounts.containsKey(mealId)) return;

    final current = _mealCounts[mealId]!;

    if (current <= 1) {
      removeFromCart(mealId);
      return;
    }

    _mealCounts[mealId] = current - 1;
    _emitUpdated();
  }

  void clearCart() {
    _myCarts.clear();
    _mealCounts.clear();
    _emitUpdated();
  }

  double get totalPrice {
    double total = 0;

    for (final meal in _myCarts) {
      final count = _mealCounts[meal.mealId] ?? 0;
      total += meal.price * count;
    }
    return total;
  }
}
