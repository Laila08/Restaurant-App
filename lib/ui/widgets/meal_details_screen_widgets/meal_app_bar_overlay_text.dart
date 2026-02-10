import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import '../../../utils/app_colors.dart';

class MealAppBarOverlayText extends StatelessWidget {
  const MealAppBarOverlayText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.blackColor.withValues(alpha: 0.3),
          borderRadius: 8.r.radiusAll,
        ),
        child: Text(
          'about_this_menu'.tr(),
          style: AppTextStyles.font17WhiteWeight600,
        ),
      ).paddingOnly(top: 45.h),
    );
  }
}
