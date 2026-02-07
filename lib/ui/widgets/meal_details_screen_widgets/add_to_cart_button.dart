import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/cart_cubit/cart_cubit.dart';
import '../../../utils/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  final dynamic meal;
  const AddToCartButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<CartCubit>().addToCart(meal);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${meal.mealName} ${'added_to_cart'.tr()}'),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.doneColor,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
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
    );
  }
}