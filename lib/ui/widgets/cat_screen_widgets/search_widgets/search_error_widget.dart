import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/utils/app_colors.dart';

class SearchErrorWidget extends StatelessWidget {
  final String errorMsg;
  const SearchErrorWidget({super.key, required this.errorMsg});

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMsg,
      style: TextStyle(fontSize: 16.sp, color: AppColors.errorColor),
      textAlign: TextAlign.center,
    ).paddingAll(16.w).centered();
  }
}
