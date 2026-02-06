import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/meal_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  // قائمة الوجبات في السلة
  final List<MealModel> _myCarts = [];
  final Map<String, int> _mealCounts = {}; // معرّف الوجبة -> الكمية

  CartCubit() : super(CartInitialState());

  List<MealModel> get myCarts => List.unmodifiable(_myCarts);
  Map<String, int> get mealCounts => Map.unmodifiable(_mealCounts);

  /// إضافة وجبة للسلة
  void addToCart(MealModel meal) {
    if (!_myCarts.any((m) => m.mealId == meal.mealId)) {
      _myCarts.add(meal);
      _mealCounts[meal.mealId!] = 1;
    } else {
      _mealCounts[meal.mealId!] = (_mealCounts[meal.mealId!] ?? 1) + 1;
    }

    emit(CartUpdatedState(
      List<MealModel>.from(_myCarts),
      Map<String, int>.from(_mealCounts),
    ));
  }

  /// إزالة وجبة من السلة بالكامل
  void removeFromCart(String mealId) {
    _myCarts.removeWhere((meal) => meal.mealId == mealId);
    _mealCounts.remove(mealId);

    emit(CartUpdatedState(
      List<MealModel>.from(_myCarts),
      Map<String, int>.from(_mealCounts),
    ));
  }

  /// زيادة كمية وجبة
  void incrementMeal(String mealId) {
    if (_mealCounts.containsKey(mealId)) {
      _mealCounts[mealId] = _mealCounts[mealId]! + 1;

      emit(CartUpdatedState(
        List<MealModel>.from(_myCarts),
        Map<String, int>.from(_mealCounts),
      ));
    }
  }

  /// تقليل كمية وجبة
  void decrementMeal(String mealId) {
    if ((_mealCounts[mealId] ?? 1) > 1) {
      _mealCounts[mealId] = _mealCounts[mealId]! - 1;

      emit(CartUpdatedState(
        List<MealModel>.from(_myCarts),
        Map<String, int>.from(_mealCounts),
      ));
    }
  }

  /// مسح السلة بالكامل
  void clearCart() {
    _myCarts.clear();
    _mealCounts.clear();
    emit(CartUpdatedState(
      List<MealModel>.from(_myCarts),
      Map<String, int>.from(_mealCounts),
    ));
  }

  /// إجمالي السعر
  double get totalPrice {
    double total = 0;
    for (var meal in _myCarts) {
      final count = _mealCounts[meal.mealId] ?? 1;
      total += (meal.price) * count;
    }
    return total;
  }
}
