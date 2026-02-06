import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class MealInfo extends StatelessWidget {
  final dynamic meal;
  const MealInfo({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meal.mealName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${NumberFormat('#,###').format(meal.price ?? 0)}",
                style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w600, fontSize: 18),
              ),
              Text(
                meal.mealArea ?? '',
                style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.w500, fontSize: 16),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Text('description'.tr(), style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          const SizedBox(height: 10),
          Text(
            meal.instructions ?? '',
            style: const TextStyle(color: Color(0xff878787)),
          ),
        ],
      ),
    );
  }
}