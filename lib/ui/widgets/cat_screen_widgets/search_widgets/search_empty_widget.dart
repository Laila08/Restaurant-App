import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import 'package:food_delivery/utils/app_colors.dart';

import '../../../../extensions/app_extensions.dart';

class SearchEmptyWidget extends StatelessWidget {
  const SearchEmptyWidget({super.key});

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.search_off, size: 40.sp, color: AppColors.grayColor),
              SizedBox(height: 8.h),
              Text(
                "no_meals_found".tr(),
                style: AppTextStyles.font16Gray700Weight500,
              ),
            ],
          ).centered().paddingAll(16.w),
        ),
      ),
    );
  }
}
