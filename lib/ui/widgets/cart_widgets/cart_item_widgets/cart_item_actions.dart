import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import '../../../../controller/cart_cubit/cart_cubit.dart';
import '../../../../theme/app_text_styles.dart';
import '../../../../utils/app_colors.dart';

class CartItemActions extends StatelessWidget {
  final String mealId;
  final int count;

  const CartItemActions({super.key, required this.mealId, required this.count});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.read<CartCubit>();
    return Row(
      children: [
        IconButton(
          onPressed: () {
            cartCubit.decrementMeal(mealId);
          },
          icon: const Icon(
            Icons.remove_circle_outline,
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          count.toString(),
          style: AppTextStyles.font16Weight500,
        ).paddingH(8.w),
        IconButton(
          onPressed: () {
            cartCubit.incrementMeal(mealId);
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
