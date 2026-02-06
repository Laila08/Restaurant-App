import 'package:flutter/material.dart';
import '../../../../data/models/category_model.dart';
import 'grid_category_list.dart';
import 'horizontal_category_list.dart';

class CategoryListContainer extends StatelessWidget {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final bool showAsGrid;
  final ScrollController horizontalController;
  final ScrollController gridController;
  final ValueChanged<int> onTapHorizontal;
  final ValueChanged<int> onTapGrid;

  const CategoryListContainer({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.showAsGrid,
    required this.horizontalController,
    required this.gridController,
    required this.onTapHorizontal,
    required this.onTapGrid,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: showAsGrid ? 175 : 90,
      child: showAsGrid
          ? GridCategoryList(
              categories: categories,
              selectedCategory: selectedCategory,
              onTap: onTapGrid,
            )
          : HorizontalCategoryList(
              categories: categories,
              selectedCategory: selectedCategory,
              onTap: onTapHorizontal,
            ),
    );
  }
}
