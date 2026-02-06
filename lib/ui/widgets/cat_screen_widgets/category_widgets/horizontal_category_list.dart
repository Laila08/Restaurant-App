import 'package:flutter/material.dart';
import '../../../../data/models/category_model.dart';
import '../../../../utils/app_colors.dart';
import '../../category_item.dart';

class HorizontalCategoryList extends StatelessWidget {
  final List<CategoryModel> categories;
  final String selectedCategory;
  final ValueChanged<int> onTap;

  const HorizontalCategoryList({
    super.key,
    required this.categories,
    required this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.symmetric(vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color:AppColors.primaryColor.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          return SizedBox(
            width: 90,
            child: CategoryItem(
              category: category,
              isSelected: selectedCategory == category.catName,
              textHeight: 10,
              fontSize: 14,
              onTap: () => onTap(index),
            ),
          );
        },
      ),
    );
  }
}
