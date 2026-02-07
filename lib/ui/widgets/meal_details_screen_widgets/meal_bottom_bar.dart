import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import 'add_to_cart_button.dart';
import 'meal_price.dart';

class MealBottomBar extends StatelessWidget {
  final dynamic meal;
  const MealBottomBar({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 1,
      right: 1,
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          height: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.primaryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.3),
                blurRadius: 5,
                offset: const Offset(0, 2),
              )
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MealPrice(meal: meal),
              AddToCartButton(meal: meal),
            ],
          ),
        ),
      ),
    );
  }
}
