import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
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
      height: 90.h,
      padding: 10.h.paddingV,
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.5),
        ),
        borderRadius: 12.r.radiusAll,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: 10.w.paddingH,
        itemCount: categories.length,
        separatorBuilder: (_, _) => 8.w.hBox,
        itemBuilder: (context, index) {
          final category = categories[index];
          return SizedBox(
            width: 90.w,
            child: CategoryItem(
              category: category,
              isSelected: selectedCategory == category.catName,
              textHeight: 10.h,
              fontSize: 14.sp,
              onTap: () => onTap(index),
            ),
          );
        },
      ),
    );
  }
}
