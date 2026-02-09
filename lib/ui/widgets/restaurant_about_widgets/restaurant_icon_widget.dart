import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/app_colors.dart';

class RestaurantIconWidget extends StatelessWidget {
  const RestaurantIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: AppColors.orange100,
        boxShadow: [
          BoxShadow(
            color: AppColors.orange100.withValues(alpha: 0.25),
            blurRadius: 12.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.restaurant,
          size: 70.r,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
