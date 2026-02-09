import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/utils/app_colors.dart';

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
      shadowColor: AppColors.grayColor.withValues(alpha: 0.5),
      borderRadius: 15.r.radiusAll,
      child: Container(
        padding: 9.w.paddingAll,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: 15.r.radiusAll,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MealImage(imageUrl: meal.mealImage),
            8.h.vBox,
            MealInfo(name: meal.mealName, price: meal.price),
          ],
        ),
      ),
    );
  }
}
