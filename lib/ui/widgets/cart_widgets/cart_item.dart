import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/data/models/meal_model.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'cart_item_widgets/cart_item_actions.dart';
import 'cart_item_widgets/cart_item_delete_icon.dart';
import 'cart_item_widgets/cart_item_image.dart';
import 'cart_item_widgets/cart_item_name_price.dart';

class CartItem extends StatelessWidget {
  final MealModel meal;
  final int count;

  const CartItem({super.key, required this.meal, required this.count});

  @override
  Widget build(BuildContext context) {
    final mealTotal = meal.price * count;

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: 15.r.radiusAll,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grayColor.withValues(alpha: 0.08),
                  spreadRadius: 1.r,
                  blurRadius: 4.r,
                  offset: Offset(1.w, 1.h),
                ),
              ],
            ),
            child: Row(
              children: [
                CartItemImage(imageUrl: meal.mealImage),
                10.w.hBox,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CartItemNamePrice(name: meal.mealName, price: mealTotal),
                      10.h.vBox,
                      CartItemActions(mealId: meal.mealId, count: count),
                    ],
                  ),
                ),
              ],
            ).paddingAll(8.w),
          ),
        ),
        CartItemDeleteIcon(mealId: meal.mealId),
      ],
    );
  }
}
