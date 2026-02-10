import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../extensions/app_extensions.dart' show AppNumX;
import '../../../../../utils/app_colors.dart';

class MealSearchShimmerItem extends StatelessWidget {
  const MealSearchShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.gray300,
      highlightColor: AppColors.gray100,
      child: Row(
        children: [
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: AppColors.gray300,
              borderRadius: 12.r.radiusAll,
            ),
          ),
          12.w.hBox,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 10.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.gray300,
                    borderRadius: 6.r.radiusAll,
                  ),
                ),
                6.h.vBox,
                Container(
                  height: 10.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    color: AppColors.gray300,
                    borderRadius: 6.r.radiusAll,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
