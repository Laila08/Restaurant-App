import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/data/models/category_model.dart';
import '../../../../controller/category_cubit/category_cubit.dart';
import 'grid_category_list.dart';
import 'horizontal_category_list.dart';
import 'category_header.dart';

class CategoryLoadedView extends StatelessWidget {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final bool showAsGrid;
  final Function({required List categories, required int index}) onCategoryTap;

  const CategoryLoadedView({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.showAsGrid,
    required this.onCategoryTap,
  });

  @override
  Widget build(BuildContext context) {
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
                  onTap: (index) =>
                      onCategoryTap(categories: categories, index: index),
                )
              : HorizontalCategoryList(
                  categories: categories,
                  selectedCategory: selectedCategory,
                  onTap: (index) =>
                      onCategoryTap(categories: categories, index: index),
                ),
        ),
      ],
    );
  }
}
