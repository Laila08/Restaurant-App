import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

import '../../../utils/app_colors.dart';

class MealInfo extends StatelessWidget {
  final dynamic meal;
  const MealInfo({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(13.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            meal.mealName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.font23Bold,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${NumberFormat('#,###').format(meal.price ?? 0)}",
                style: AppTextStyles.font17PrimaryWeight600,
              ),
              Text(
                meal.mealArea ?? '',
                style: AppTextStyles.font16PrimaryWeight600,
              ),
            ],
          ),
          SizedBox(height: 25.h),
          Text(
            'description'.tr(),
            style: AppTextStyles.font16Weight500,
          ),
          SizedBox(height: 10.h),
          Text(
            meal.instructions ?? '',
            style: TextStyle(color: AppColors.grayColor),
          ),
        ],
      ),
    );
  }
}
