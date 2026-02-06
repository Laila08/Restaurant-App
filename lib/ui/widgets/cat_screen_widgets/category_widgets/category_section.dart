import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/category_cubit/category_cubit.dart';
import '../../../../controller/meal_cubit/meal_cubit.dart';
import 'grid_category_list.dart';
import 'horizontal_category_list.dart';
import 'category_header.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  bool _isFirstLoad = true; // ✅ لمنع تحميل الوجبات أكثر من مرة عند البداية

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoadedState) {
          final categories = state.categories;
          final showAsGrid = state.showAsGrid;
          final selectedCategory = state.selectedCategory;

          // ✅ تحميل وجبات أول كاتيجوري عند أول تحميل فقط
          if (_isFirstLoad && selectedCategory.isNotEmpty) {
            _isFirstLoad = false;
            context.read<MealCubit>().getMealData(selectedCategory);
          }

          return Column(
            children: [
              CategoryHeader(
                showAsGrid: showAsGrid,
                onToggle: () {
                  context.read<CategoryCubit>().toggleViewMode();
                },
              ),
              SizedBox(
                height: showAsGrid ? 175 : 100,
                child: showAsGrid
                    ? GridCategoryList(
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onTap: (index) {
                    final selectedCat = categories[index].catName;
                    context
                        .read<CategoryCubit>()
                        .selectCategory(selectedCat);
                    context.read<MealCubit>().getMealData(selectedCat);
                  },
                )
                    : HorizontalCategoryList(
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onTap: (index) {
                    final selectedCat = categories[index].catName;
                    context
                        .read<CategoryCubit>()
                        .selectCategory(selectedCat);
                    context.read<MealCubit>().getMealData(selectedCat);
                  },
                ),
              ),
            ],
          );
        } else if (state is CategoryLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is CategoryErrorState) {
          return const Center(child: Text('error'));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
