import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/app_colors.dart';

class MealAppBarBackButton extends StatelessWidget {
  const MealAppBarBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 32.h,
      left: 20.w,
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () => Navigator.pop(context),
        color: AppColors.whiteColor,
      ),
    );
  }
}
