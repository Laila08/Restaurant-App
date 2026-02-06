import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../controller/cart_cubit/cart_cubit.dart';
import '../../../utils/app_colors.dart';
import 'package:intl/intl.dart';

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
        color: Colors.white,
        shadowColor: Colors.grey,
        elevation: 5,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 55,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // السعر
              Text(
                "\$${NumberFormat('#,###').format(meal.price ?? 0)}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
              // زر إضافة للكارت
              ElevatedButton(
                onPressed: () {
                  // استدعاء CartCubit لإضافة المنتج
                  context.read<CartCubit>().addToCart(meal);
                  // اختياري: اظهار SnackBar لتأكيد الإضافة
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${meal.mealName} ${'added_to_cart'.tr()}'),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: const StadiumBorder(),
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                ),
                child: Row(
                  children: [
                    Icon(Icons.shopping_cart_outlined,
                        color: AppColors.primaryColor, size: 20),
                    const SizedBox(width: 10),
                    Text(
                      'add_to_cart'.tr(),
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
