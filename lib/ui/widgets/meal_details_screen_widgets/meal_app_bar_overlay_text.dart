import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

class MealAppBarOverlayText extends StatelessWidget {
  const MealAppBarOverlayText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: 45.h),
        child: Text(
          'about_this_menu'.tr(),
          style: AppTextStyles.font15PrimaryWeight600,
        ),
      ),
    );
  }
}
