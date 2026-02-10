import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/data/models/meal_model.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import '../../../utils/app_colors.dart';
import 'add_to_cart_button.dart';
import 'meal_price.dart';

class MealBottomBar extends StatelessWidget {
  final MealModel meal;
  const MealBottomBar({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 1.w,
      right: 1.w,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
          height: 58.h,
          decoration: BoxDecoration(
            borderRadius: 50.r.radiusAll,
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.grayColor.withValues(alpha: 0.3),
                blurRadius: 5.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MealPrice(meal: meal),
              SizedBox(
                width: context.width * 0.5,
                child: AddToCartButton(meal: meal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
