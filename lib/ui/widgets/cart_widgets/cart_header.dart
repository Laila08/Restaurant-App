import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../extensions/app_extensions.dart';
import '../../../utils/app_colors.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 90,
      color: AppColors.primaryColor,
      child: Text(
        "My Cart".tr(),
        style:  TextStyle(
            fontSize: 20, fontWeight: FontWeight.w600,color: AppColors.whiteColor),
      ).centered().paddingOnlyDirectional(bottom:0 , top: 40,end:16 ,start:16 ),
    );
  }
}