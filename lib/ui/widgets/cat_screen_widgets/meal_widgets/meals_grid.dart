import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/utils/app_colors.dart';
import '../../../../controller/meal_cubit/meal_cubit.dart';
import 'meal_item.dart';

class MealsGrid extends StatelessWidget {
  final int? maxItems; // عدد العناصر التي سيتم عرضها (null = عرض كل العناصر)
  final VoidCallback? onSeeMore; // Callback لزر "عرض المزيد"

  const MealsGrid({
    super.key,
    this.maxItems,
    this.onSeeMore,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MealCubit, MealState>(
      builder: (context, state) {
        if (state is MealLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MealLoadedState) {
          final meals = state.meals;
          final displayCount =
          (maxItems != null && meals.length > maxItems!) ? maxItems! : meals.length;

          return SingleChildScrollView(
            child: Column(
              children: [
                GridView.builder(
                  shrinkWrap: true, // مهم لكي يعمل داخل Column
                  physics: const NeverScrollableScrollPhysics(), // تعطيل السكروول داخل Column
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 15),
                  itemCount: displayCount,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final meal = meals[index];
                    return MealItem(meal: meal);
                  },
                ),
                if (onSeeMore != null && meals.length > displayCount)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextButton(
                      onPressed: onSeeMore,
                      child:  Text(
                        'See More',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        } else if (state is MealErrorState) {
          return const Center(child: Text('Error loading meals'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
