import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

class CartItemNamePrice extends StatelessWidget {
  final String name;
  final double price;

  const CartItemNamePrice({super.key, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.font16Weight500,
        ).paddingOnly(right: 22.w),
        SizedBox(height: 8.h),
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: AppTextStyles.font16Weight500,
        ),
      ],
    );
  }
}
