import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/cart_cubit/cart_cubit.dart';
import '../../../../utils/app_colors.dart';

class CartItemDeleteIcon extends StatelessWidget {
  final String mealId;
  const CartItemDeleteIcon({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10.h,
      right: 10.w,
      child: IconButton(
        onPressed: () {
          context.read<CartCubit>().removeFromCart(mealId);
        },
        icon: Icon(
          Icons.delete_outline,
          color: AppColors.primaryColor,
          size: 20.sp,
        ),
      ),
    );
  }
}
