import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../utils/app_colors.dart';
import 'meal_card_shimmer_content.dart';

class MealCardShimmer extends StatelessWidget {
  const MealCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray300,
      highlightColor: AppColors.gray100,
      period: const Duration(milliseconds: 1200),
      child: const MealCardShimmerContent(),
    );
  }
}
