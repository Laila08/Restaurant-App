import 'package:flutter/material.dart';
import '../../../../data/models/meal_model.dart';
import 'meal_item_card.dart';

class MealItem extends StatelessWidget {
  final MealModel meal;
  final TextEditingController searchController;

  const MealItem({
    super.key,
    required this.meal,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return MealItemCard(meal: meal, searchController: searchController);
  }
}
