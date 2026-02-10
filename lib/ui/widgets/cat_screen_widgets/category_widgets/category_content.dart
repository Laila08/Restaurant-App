import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/category_cubit/category_cubit.dart';
import '../../../../controller/meal_cubit/meal_cubit.dart';
import 'category_loaded_view.dart';
import 'category_loading_view.dart';

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
          return const CategoryLoadingView();
        }

        if (state is CategoryLoadedState) {
          if (_isFirstLoad && state.selectedCategory.isNotEmpty) {
            _isFirstLoad = false;
            context.read<MealCubit>().getMealData(state.selectedCategory);
          }
          return CategoryLoadedView(
            categories: state.categories,
            selectedCategory: state.selectedCategory,
            showAsGrid: state.showAsGrid,
            onCategoryTap: _onCategoryTap,
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
