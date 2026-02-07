import 'package:flutter/material.dart';

import '../../../../data/models/meal_model.dart';
import 'meal_image.dart';
import 'meal_info.dart';

class MealCard extends StatelessWidget {
  final MealModel meal;

  const MealCard({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: Colors.grey.withValues(alpha: 0.5),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MealImage(imageUrl: meal.mealImage),
            const SizedBox(height: 8),
            MealInfo(name: meal.mealName, price: meal.price),
          ],
        ),
      ),
    );
  }
}