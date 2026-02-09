import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/meal_cubit/meal_cubit.dart';
import 'meal_list.dart';

class MealsGrid extends StatelessWidget {
  final int? maxItems;

  const MealsGrid({super.key, this.maxItems});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      buildWhen: (previous, current) =>
      current is MealLoadingState || current is MealLoadedState,
      builder: (context, state) {
        if (state is MealLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MealLoadedState) {
          final meals = state.meals;
          final displayCount = (maxItems != null && meals.length > maxItems!)
              ? maxItems!
              : meals.length;

          return MealList(meals: meals, displayCount: displayCount);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
