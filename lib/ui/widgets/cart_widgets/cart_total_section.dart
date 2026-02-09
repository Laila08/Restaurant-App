import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import 'package:food_delivery/ui/widgets/app_button.dart';

import '../../../extensions/app_extensions.dart';
import '../../../routes/routes.dart';

class CartTotalSection extends StatelessWidget {
  final double totalPrice;
  const CartTotalSection({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total".tr(),
                style: AppTextStyles.font15PrimaryWeight600,
              ),
              Text(
                "\$${totalPrice.toStringAsFixed(2)}",
                style: AppTextStyles.font20Bold,
              ),
            ],
          ),
          SizedBox(
            width: 0.4.sw,
            child: AppButton(
              onTap: () {
                context.pushNamed(Routes.booking, arguments: totalPrice);
              },
              text: "Confirm Order".tr(),
            ),
          ),
        ],
      ),
    );
  }
}
