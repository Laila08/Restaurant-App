import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';

import '../../../../controller/category_cubit/category_cubit.dart';
import '../../../../controller/meal_cubit/meal_cubit.dart';
import '../../../../theme/app_text_styles.dart';
import 'grid_category_list.dart';
import 'horizontal_category_list.dart';
import 'category_header.dart';
import 'horizontal_category_shimmer.dart';

class CategoryContent extends StatefulWidget {
  const CategoryContent({super.key});

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  bool _isFirstLoad = true;

  void _onCategoryTap({required List categories, required int index}) {
    final selectedCat = categories[index].catName;
    context.read<CategoryCubit>().selectCategory(selectedCat);
    context.read<MealCubit>().getMealData(selectedCat);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
          current is CategoryLoadedState || current is CategoryLoadingState,
      builder: (context, state) {
        if (state is CategoryLoadingState) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "find_by_category".tr(),
                style: AppTextStyles.font17PrimaryWeight600,
              ).paddingV(10),
              SizedBox(height: 100.h, child: const HorizontalCategoryShimmer()),
            ],
          ).paddingH(15.w).paddingV(5.h);
        }

        if (state is CategoryLoadedState) {
          final categories = state.categories;
          final showAsGrid = state.showAsGrid;
          final selectedCategory = state.selectedCategory;

          if (_isFirstLoad && selectedCategory.isNotEmpty) {
            _isFirstLoad = false;
            context.read<MealCubit>().getMealData(selectedCategory);
          }

          return Column(
            children: [
              CategoryHeader(
                showAsGrid: showAsGrid,
                onToggle: () => context.read<CategoryCubit>().toggleViewMode(),
              ),
              SizedBox(
                height: showAsGrid ? 175.h : 100.h,
                child: showAsGrid
                    ? GridCategoryList(
                        categories: categories,
                        selectedCategory: selectedCategory,
                        onTap: (index) => _onCategoryTap(
                          categories: categories,
                          index: index,
                        ),
                      )
                    : HorizontalCategoryList(
                        categories: categories,
                        selectedCategory: selectedCategory,
                        onTap: (index) => _onCategoryTap(
                          categories: categories,
                          index: index,
                        ),
                      ),
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
