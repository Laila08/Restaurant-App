import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

import '../../../../data/models/category_model.dart';
import '../../category_item.dart';

class GridCategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final ValueChanged<int> onTap;

  const GridCategoryList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:AppColors.primaryColor.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: GridView.builder(
        padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 10, 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            category: category,
            isSelected: selectedCategory == category.catName,
            textHeight: 12,
            fontSize: 12,
            onTap: () => onTap(index),
          );
        },
      ),
    );
  }
}