import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/ui/widgets/shimmer_text.dart';
import '../../data/models/category_model.dart';
import '../../utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;
  final double textHeight;
  final double fontSize;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
    required this.textHeight,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      shadowColor: AppColors.grayColor.withValues(alpha: 0.04),
      borderRadius: 15.radiusAll,
      color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
      child: InkWell(
        borderRadius: 15.radiusAll,
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: 12.radiusAll,
              child: Image.network(
                category.catImage,
                height: 35.d,
                width: 60.d,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Icon(Icons.broken_image, size: 40.d),
              ),
            ),
            6.d.vBox,
            ShimmerText(
              isLoading: false,
              text: category.catName,
              height: textHeight.d,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: isSelected ? AppColors.whiteColor : AppColors.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: fontSize.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
