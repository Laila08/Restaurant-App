import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

import '../../../extensions/app_extensions.dart';
import '../../../utils/app_colors.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 90.h,
      color: AppColors.primaryColor,
      child: Text("My Cart".tr(), style: AppTextStyles.font20BlackWeight600)
          .centered()
          .paddingOnlyDirectional(
            bottom: 0.h,
            top: 40.h,
            end: 16.w,
            start: 16.w,
          ),
    );
  }
}
