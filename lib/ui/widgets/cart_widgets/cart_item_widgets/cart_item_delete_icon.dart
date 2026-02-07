import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/cart_cubit/cart_cubit.dart';
import '../../../../utils/app_colors.dart';

class CartItemDeleteIcon extends StatelessWidget {
  final String mealId;
  const CartItemDeleteIcon({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      right: 10,
      child: IconButton(
        onPressed: () {
          context.read<CartCubit>().removeFromCart(mealId);
        },
        icon: const Icon(
          Icons.delete_outline,
          color: AppColors.primaryColor,
          size: 20,
        ),
      ),
    );
  }
}
