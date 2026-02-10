import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/ui/widgets/cat_screen_widgets/meal_widgets/meals_search_shimmer.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/extensions/app_extensions.dart';

class SearchLoadingWidget extends StatelessWidget {
  const SearchLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = context.height;
    return Positioned(
      top: (height * 0.14).h,
      left: 16.w,
      right: 16.w,
      child: Material(
        elevation: 8,
        color: AppColors.transparentColor,
        borderRadius: 12.r.radiusAll,
        child: Container(
          constraints: BoxConstraints(maxHeight: (height * 0.4).h),
          decoration: BoxDecoration(
            color: AppColors.gray100,
            borderRadius: 12.r.radiusAll,
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withValues(alpha: 0.05),
                blurRadius: 8.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: const MealsSearchShimmer(),
        ),
      ),
    );
  }
}
