import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../utils/app_colors.dart';
import '../../../../extensions/app_extensions.dart';

class MealInfoShimmer extends StatelessWidget {
  const MealInfoShimmer({super.key});

  Widget _shimmerLine({
    required double width,
    required double height,
    double radius = 6,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.gray300,
        borderRadius: BorderRadius.circular(radius.r),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray300,
      highlightColor: AppColors.gray100,
      period: const Duration(milliseconds: 1200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 0.5.sh,
            color: AppColors.gray400,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.h.vBox,
              _shimmerLine(width: 200.w, height: 25.h, radius: 10),
              10.h.vBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _shimmerLine(width: 100.w, height: 17.h),
                  _shimmerLine(width: 80.w, height: 17.h),
                ],
              ),
              25.h.vBox,
              _shimmerLine(width: 120.w, height: 16.h),
              10.h.vBox,
              _shimmerLine(width: double.infinity, height: 14.h),
              6.h.vBox,
              _shimmerLine(width: double.infinity, height: 14.h),
              6.h.vBox,
              _shimmerLine(width: 250.w, height: 14.h),
            ],
          ).paddingAll(13.w),
        ],
      ),
    );
  }
}
