import 'package:flutter/material.dart';

class MealAppBarBackground extends StatelessWidget {
  final dynamic meal;
  const MealAppBarBackground({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: meal.mealId ?? '',
      child: Image.network(
        meal.mealImage ?? '',
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: Colors.grey[200],
          child: const Icon(Icons.broken_image, size: 50),
        ),
      ),
    );
  }
}