import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/category_cubit/category_cubit.dart';
import '../../../../controller/meal_cubit/meal_cubit.dart';
import '../../../../utils/app_colors.dart';
import '../../../screens/all_meals_screen.dart';

class SeeMoreButton extends StatelessWidget {
  const SeeMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextButton(
        onPressed: () {
          final categoryState = context.read<CategoryCubit>().state;
          if (categoryState is CategoryLoadedState) {
            final selectedCategory = categoryState.selectedCategory;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: context.read<MealCubit>()..getMealData(selectedCategory),
                  child: AllMealsScreen(categoryName: selectedCategory),
                ),
              ),
            );
          }
        },
        child: Text(
          "See More".tr(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}