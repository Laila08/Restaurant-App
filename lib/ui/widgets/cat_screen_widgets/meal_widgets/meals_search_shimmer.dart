import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../extensions/app_extensions.dart';
import 'shimmer/meal_search_shimmer_item.dart';

class MealsSearchShimmer extends StatelessWidget {
  const MealsSearchShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      itemCount: 5,
      itemBuilder: (context, index) => const MealSearchShimmerItem().paddingV(8.h),
    );
  }
}
