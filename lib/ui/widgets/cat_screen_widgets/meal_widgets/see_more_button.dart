import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

import '../../../../controller/category_cubit/category_cubit.dart';
import '../../../../controller/meal_cubit/meal_cubit.dart';
import '../../../screens/all_meals_screen.dart';

class SeeMoreButton extends StatelessWidget {
  final TextEditingController searchController;
  const SeeMoreButton({super.key, required this.searchController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: TextButton(
        onPressed: () {
          final categoryState = context.read<CategoryCubit>().state;
          if (categoryState is CategoryLoadedState) {
            final selectedCategory = categoryState.selectedCategory;

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: context.read<MealCubit>()
                    ..getMealData(selectedCategory),
                  child: AllMealsScreen(
                    categoryName: selectedCategory,
                    searchController: searchController,
                  ),
                ),
              ),
            );
          }
        },
        child: Text(
          "See More".tr(),
          style: AppTextStyles.font16PrimaryWeight600,
        ),
      ),
    );
  }
}
