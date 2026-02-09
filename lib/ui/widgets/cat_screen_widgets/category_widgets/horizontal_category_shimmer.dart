import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../extensions/app_extensions.dart';
import '../../../../utils/app_colors.dart';

class HorizontalCategoryShimmer extends StatelessWidget {
  final int itemCount;

  const HorizontalCategoryShimmer({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      padding: 10.h.paddingV,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        border: Border.all(
          color: AppColors.primaryColor.withValues(alpha: 0.5),
        ),
        borderRadius: 12.r.radiusAll,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: 10.w.paddingH,
        itemCount: itemCount,
        separatorBuilder: (_, _) => 8.w.hBox,
        itemBuilder: (_, _) => Shimmer.fromColors(
          baseColor: AppColors.gray300,
          highlightColor: AppColors.gray100,
          child: Container(
            width: 90.w,
            decoration: BoxDecoration(
              color: AppColors.gray400,
              borderRadius: 8.r.radiusAll,
            ),
          ),
        ),
      ),
    );
  }
}
