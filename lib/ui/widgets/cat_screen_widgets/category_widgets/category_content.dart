import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../controller/category_cubit/category_cubit.dart';
import '../../../../controller/meal_cubit/meal_cubit.dart';
import '../../../../extensions/app_extensions.dart';
import 'grid_category_list.dart';
import 'horizontal_category_list.dart';
import 'category_header.dart';

class CategoryContent extends StatefulWidget {
  const CategoryContent({super.key});

  @override
  State<CategoryContent> createState() => _CategoryContentState();
}

class _CategoryContentState extends State<CategoryContent> {
  bool _isFirstLoad = true;

  void _onCategoryTap({
    required List categories,
    required int index,
  }) {
    final selectedCat = categories[index].catName;
    context.read<CategoryCubit>().selectCategory(selectedCat);
    context.read<MealCubit>().getMealData(selectedCat);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      buildWhen: (previous, current) =>
      current is CategoryLoadedState ||
          current is CategoryLoadingState ||
          current is CategoryErrorState,
      builder: (context, state) {
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
              ).paddingV(10),
              SizedBox(
                height: showAsGrid ? 175 : 100,
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

        if (state is CategoryLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is CategoryErrorState) {
          return Center(child: Text('no_categories_found'.tr()));
        }

        return const SizedBox.shrink();
      },
    );
  }
}
