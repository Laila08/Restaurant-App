import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/meal_cubit/meal_cubit.dart';
import 'meal_list.dart';
import 'meal_shimmer_grid.dart';

class MealsGrid extends StatelessWidget {
  final int? maxItems;

  const MealsGrid({super.key, this.maxItems});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealLoadingState) {
          return const MealShimmerGrid();
        }

        if (state is MealEmptyState) {
          return Center(
            child: Text(
              '${"no_meals".tr()}. ${"no_meals_suggestion".tr()}',
              textAlign: TextAlign.center,
            ),
          );
        }

        if (state is MealErrorState) {
          return Center(child: Text(state.error));
        }

        if (state is MealLoadedState) {
          final meals = state.meals;
          final displayCount = maxItems == null
              ? meals.length
              : meals.length.clamp(0, maxItems!);

          return MealList(meals: meals, displayCount: displayCount);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
