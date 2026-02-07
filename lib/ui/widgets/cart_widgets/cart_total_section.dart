import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../extensions/app_extensions.dart';
import '../../../routes/routes.dart';
import '../../../utils/app_colors.dart';

class CartTotalSection extends StatelessWidget {
  final double totalPrice;
  const CartTotalSection({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              context.pushNamed(Routes.booking, arguments: totalPrice);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              shape: const StadiumBorder(),
            ),
            child: Text(
              "Confirm Order".tr(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}