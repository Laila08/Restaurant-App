import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../extensions/app_extensions.dart';
import '../../../../../utils/app_colors.dart';
import 'shimmer_image.dart';
import 'shimmer_line.dart';

class MealCardShimmerContent extends StatelessWidget {
  const MealCardShimmerContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: 12.r.radiusAll,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerImage(),
          8.h.vBox,
          ShimmerLine(width: 100.w, height: 16.h),
          4.h.vBox,
          ShimmerLine(width: 60.w, height: 14.h),
          8.h.vBox,
        ],
      ),
    );
  }
}
