import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/meal_cubit/meal_cubit.dart';
import 'meal_shimmer_grid.dart';
import 'meals_grid_widgets/meal_empty_widget.dart';
import 'meals_grid_widgets/meal_error_widget.dart';
import 'meals_grid_widgets/meal_list_wrapper.dart';

class MealsGrid extends StatelessWidget {
  final int? maxItems;
  final TextEditingController searchController;

  const MealsGrid({super.key, this.maxItems, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealLoadingState) {
          return const MealShimmerGrid();
        } else if (state is MealEmptyState) {
          return MealEmptyWidget();
        } else if (state is MealErrorState) {
          return MealErrorWidget(error: state.error);
        } else if (state is MealLoadedState) {
          final meals = state.meals;
          final displayCount = maxItems == null
              ? meals.length
              : meals.length.clamp(0, maxItems!);
          return MealListWrapper(
            meals: meals,
            displayCount: displayCount,
            searchController: searchController,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
