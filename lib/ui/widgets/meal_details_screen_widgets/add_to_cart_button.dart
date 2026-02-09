import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import 'package:food_delivery/ui/widgets/app_button.dart';

import '../../../controller/cart_cubit/cart_cubit.dart';
import '../../../utils/app_colors.dart';

class AddToCartButton extends StatelessWidget {
  final dynamic meal;
  const AddToCartButton({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: 'add_to_cart'.tr(),
      color: AppColors.whiteColor,
      textStyle: AppTextStyles.font15PrimaryWeight600,
      onTap: () {
        context.read<CartCubit>().addToCart(meal);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${meal.mealName} ${'added_to_cart'.tr()}'),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.doneColor,
          ),
        );
      },
    );
  }
}
