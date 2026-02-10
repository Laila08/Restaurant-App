import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import '../../../../../utils/app_colors.dart';

class MealEmptyWidget extends StatelessWidget {
  const MealEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 16.w.paddingAll,
      decoration: BoxDecoration(
        color: AppColors.orange50,
        borderRadius: 12.r.radiusAll,
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.1),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 60.sp,
            color: AppColors.primaryColor.withValues(alpha: 0.8),
          ),
          12.h.vBox,
          Text(
            "no_meals".tr(),
            style: AppTextStyles.font18Primary700Weight600,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4.h),
          Text(
            "no_meals_suggestion".tr(),
            style: AppTextStyles.font14Primary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ).centered();
  }
}
