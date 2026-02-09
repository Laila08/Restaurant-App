import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/utils/app_assets.dart';
import 'package:lottie/lottie.dart';

import '../../../controller/cart_cubit/cart_cubit.dart';
import 'cart_item.dart';
import 'cart_total_section.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is CartLoadingState ||
          current is CartUpdatedState ||
          current is CartInitialState,
      builder: (context, state) {
        if (state is CartLoadingState) {
          return CircularProgressIndicator().centered();
        }
        if (state is CartInitialState) {
          return Lottie.asset(
            AppAssets.emptyBoxLottie,
            width: 250.w,
            fit: BoxFit.cover,
          ).centered();
        }
        if (state is CartUpdatedState) {
          final carts = state.mealCarts;
          final totalPrice = carts.fold<double>(
            0.0,
            (sum, meal) =>
                sum + (meal.price * (state.mealCounts[meal.mealId] ?? 1)),
          );

          if (carts.isEmpty) {
            return Lottie.asset(
              AppAssets.emptyBoxLottie,
              width: 250.w,
              fit: BoxFit.cover,
            ).centered();
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: carts.length,
                  padding: 12.h.paddingV,
                  itemBuilder: (context, index) {
                    final meal = carts[index];
                    final count = state.mealCounts[meal.mealId] ?? 1;
                    return CartItem(meal: meal, count: count);
                  },
                ),
              ),
              CartTotalSection(totalPrice: totalPrice),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
