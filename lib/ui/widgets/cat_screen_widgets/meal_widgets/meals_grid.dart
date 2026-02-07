import 'package:easy_localization/easy_localization.dart';
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
      builder: (context, state) {
        if (state is MealLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MealLoadedState) {
          final meals = state.meals;
          final displayCount = (maxItems != null && meals.length > maxItems!)
              ? maxItems!
              : meals.length;

          return MealList(meals: meals, displayCount: displayCount);
        } else if (state is MealErrorState) {
          return Center(child: Text('error_loading_meals'.tr()));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
