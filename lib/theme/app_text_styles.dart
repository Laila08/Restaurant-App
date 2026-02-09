import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

abstract class AppTextStyles {
  static final font22PrimaryWeight600 = TextStyle(
    fontSize: 22.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );

  static final font17BlackWeight400 = TextStyle(
    fontSize: 17.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w400,
  );
  static final font22BlackWeight600 = TextStyle(
    fontSize: 22.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w600,
  );
  static final internetTextStyle = TextStyle(
    color: AppColors.primaryColor,
    fontWeight: FontWeight.bold,
    fontSize: 40.sp,
  );
  static final font15PrimaryWeight600 = TextStyle(
    fontSize: 15.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
  static final splashTextStyle = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteColor,
    shadows: const [Shadow(blurRadius: 8, color: AppColors.black54)],
  );

  static final font15WhiteWeight500 = TextStyle(
    fontSize: 15.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w500,
  );

  static final restaurantName = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static final infoTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
  );

  static final infoValue = TextStyle(
    fontSize: 14.sp,
    color: Colors.black87,
    height: 1.4,
  );

  static final font14blackWeight500 = TextStyle(
    fontSize: 14.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
  );
  static final font17PrimaryWeight600 = TextStyle(
    fontSize: 17.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
  static final font17WhiteWeight600 = TextStyle(
    fontSize: 17.sp,
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
  );

  static final font25WhiteWeight600 = TextStyle(
    color: AppColors.whiteColor,
    fontWeight: FontWeight.w600,
    fontSize: 25.sp,
  );

  static final font20BlackWeight600 = TextStyle(
    color: AppColors.blackColor,
    fontWeight: FontWeight.w600,
    fontSize: 20.sp,
  );

  static final font15Black87 = TextStyle(
    fontSize: 15.sp,
    color: Colors.black87,
    height: 1.5,
  );
  static final font20Bold = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );
  static final font23Bold = TextStyle(
    fontSize: 23.sp,
    fontWeight: FontWeight.w600,
  );
  static final font16BlackWeight500 = TextStyle(
    fontSize: 18.sp,
    color: AppColors.blackColor,
    fontWeight: FontWeight.w500,
  );

  static final font16Weight500 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static final font16PrimaryWeight600 = TextStyle(
    fontSize: 16.sp,
    color: AppColors.primaryColor,
    fontWeight: FontWeight.w600,
  );
}
