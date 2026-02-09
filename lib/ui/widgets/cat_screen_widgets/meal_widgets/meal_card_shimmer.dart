import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/app_colors.dart';
import '../../../../extensions/app_extensions.dart';

class MealCardShimmer extends StatelessWidget {
  const MealCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray300,
      highlightColor: AppColors.gray100,
      period: const Duration(milliseconds: 1200),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: 12.r.radiusAll,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                color: AppColors.gray400,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.r),
                  topRight: Radius.circular(12.r),
                ),
              ),
            ),
            8.h.vBox,
            Container(
              width: 100.w,
              height: 16.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                gradient: LinearGradient(
                  colors: [AppColors.gray400, AppColors.gray200],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ).paddingH(8.w),
            4.h.vBox,
            Container(
              width: 60.w,
              height: 14.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                gradient: LinearGradient(
                  colors: [AppColors.gray400, AppColors.gray200],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ).paddingH(8.w),
            8.h.vBox,
          ],
        ),
      ),
    );
  }
}
