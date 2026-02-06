import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/extensions/app_extentions.dart';
import 'package:food_delivery/routes/routes.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:lottie/lottie.dart';
import '../../controller/cart_cubit/cart_cubit.dart';
import 'dart:ui' as ui;

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.locale.languageCode == 'ar'
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 90,
            color: AppColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
              child: Text(
                "My Cart".tr(),
                style:  TextStyle(
                    fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.whiteColor),
              ).centered(),
            ),
          ),
          Expanded(
            child: BlocBuilder<CartCubit, CartState>(
              builder: (context, state) {
                if (state is CartInitialState) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is CartUpdatedState) {
                  final carts = state.mealCarts;
                  final totalPrice = carts.fold<double>(
                    0.0,
                        (sum, meal) =>
                    sum +
                        (meal.price *
                            (state.mealCounts[meal.mealId] ?? 1)),
                  );

                  if (carts.isEmpty) {
                    return Center(
                      child: Lottie.asset(
                        "assets/images/Empty box.json",
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    );
                  }

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: carts.length,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          itemBuilder: (context, index) {
                            final meal = carts[index];
                            final count = state.mealCounts[meal.mealId] ?? 1;
                            final mealTotal = meal.price * count;

                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: index == carts.length - 1 ? 10 : 6),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          color: AppColors.primaryColor
                                              .withOpacity(0.3),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(15),
                                          child: meal.mealImage != null &&
                                              meal.mealImage!.isNotEmpty
                                              ? Image.network(
                                            meal.mealImage!,
                                            fit: BoxFit.cover,
                                          )
                                              : Container(
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              meal.mealName ?? '',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              "\$${mealTotal.toStringAsFixed(2)}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                // زر حذف
                                                IconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<CartCubit>()
                                                        .removeFromCart(
                                                        meal.mealId!);
                                                  },
                                                  icon: const Icon(
                                                    Icons.delete_outline,
                                                    color:
                                                    AppColors.primaryColor,
                                                    size: 20,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                // زر -
                                                IconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<CartCubit>()
                                                        .decrementMeal(
                                                        meal.mealId!);
                                                  },
                                                  icon: const Icon(
                                                    Icons.remove_circle_outline,
                                                    color:
                                                    AppColors.primaryColor,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8),
                                                  child: Text(
                                                    count.toString(),
                                                    style: const TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                        FontWeight.w500),
                                                  ),
                                                ),
                                                // زر +
                                                IconButton(
                                                  onPressed: () {
                                                    context
                                                        .read<CartCubit>()
                                                        .incrementMeal(
                                                        meal.mealId!);
                                                  },
                                                  icon: const Icon(
                                                    Icons.add_circle_outline,
                                                    color:
                                                    AppColors.primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total".tr(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: AppColors.primaryColor),
                                ),
                                Text(
                                  "\$${totalPrice.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                               context.pushNamed(Routes.booking,arguments: totalPrice);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryColor,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 40),
                                shape: const StadiumBorder(),
                              ),
                              child: Text(
                                "Confirm Order".tr(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
