import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/cart_cubit/cart_cubit.dart';
import '../../../../utils/app_colors.dart';

class CartItemActions extends StatelessWidget {
  final String mealId;
  final int count;

  const CartItemActions({super.key, required this.mealId, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        IconButton(
          onPressed: () {
            context.read<CartCubit>().decrementMeal(mealId);
          },
          icon: const Icon(
            Icons.remove_circle_outline,
            color: AppColors.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            count.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        IconButton(
          onPressed: () {
            context.read<CartCubit>().incrementMeal(mealId);
          },
          icon: const Icon(
            Icons.add_circle_outline,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
