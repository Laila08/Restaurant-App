import 'package:flutter/material.dart';
import '../../../../../data/models/meal_model.dart';
import '../meal_list.dart';

class MealListWrapper extends StatelessWidget {
  final List<MealModel> meals;
  final int displayCount;
  final TextEditingController searchController;

  const MealListWrapper({
    super.key,
    required this.meals,
    required this.displayCount,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return MealList(
      meals: meals,
      displayCount: displayCount,
      searchController: searchController,
    );
  }
}
