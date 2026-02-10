import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/app_colors.dart';

class MealAppBarBackButton extends StatelessWidget {
  const MealAppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final isArabic = Directionality.of(context) == TextDirection.rtl;
    return Positioned(
      top: 32.h,
      left: isArabic ? null : 20.w,
      right: isArabic ? 20.w : null,

      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
        color: AppColors.whiteColor,
      ),
    );
  }
}
