import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
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
      padding: 10.h.paddingV,
      margin: 10.w.paddingH,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.5),
        ),
        borderRadius: 12.r.radiusAll,
      ),
      child: GridView.builder(
        padding: 10.w.paddingH,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 1,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return CategoryItem(
            category: category,
            isSelected: selectedCategory == category.catName,
            textHeight: 12.h,
            fontSize: 12.sp,
            onTap: () => onTap(index),
          );
        },
      ),
    );
  }
}
