import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

class MealPrice extends StatelessWidget {
  final dynamic meal;
  const MealPrice({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Text(
      "\$${NumberFormat('#,###').format(meal.price ?? 0)}",
      style: AppTextStyles.font17WhiteWeight600,
    );
  }
}
