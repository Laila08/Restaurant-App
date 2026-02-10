import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'shimmer/meal_card_shimmer.dart';

class MealShimmerGrid extends StatelessWidget {
  final int itemCount;
  final int crossAxisCount;

  const MealShimmerGrid({
    super.key,
    this.itemCount = 4,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsetsDirectional.fromSTEB(10.w, 5.h, 10.w, 15.h),
      itemCount: itemCount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 10.h,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (context, index) => const MealCardShimmer(),
    );
  }
}
