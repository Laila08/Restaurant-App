import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'meal_item.dart';
import 'see_more_button.dart';

class MealList extends StatelessWidget {
  final List meals;
  final int displayCount;

  const MealList({super.key, required this.meals, required this.displayCount});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsetsDirectional.fromSTEB(10.w, 5.h, 10.w, 15.h),
            itemCount: displayCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.85,
            ),
            itemBuilder: (context, index) => MealItem(meal: meals[index]),
          ),
          if (meals.length > displayCount) SeeMoreButton(),
        ],
      ),
    );
  }
}
