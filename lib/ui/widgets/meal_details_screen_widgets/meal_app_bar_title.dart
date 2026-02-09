import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

class MealAppBarTitle extends StatelessWidget {
  final String? mealName;
  const MealAppBarTitle({super.key, this.mealName});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            mealName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.font20Bold,
          ).paddingOnly(top: 30.h),
        ),
      ],
    );
  }
}
