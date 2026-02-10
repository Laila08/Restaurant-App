import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/app_colors.dart';

import '../../../data/models/meal_model.dart';

class MealAppBarBackground extends StatelessWidget {
  final MealModel meal;
  const MealAppBarBackground({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: meal.mealId,
      child: Image.network(
        meal.mealImage,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: AppColors.grayOpacity,
          child: Icon(Icons.broken_image, size: 50.sp),
        ),
      ),
    );
  }
}
