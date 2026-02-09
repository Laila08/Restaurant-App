import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/app_colors.dart';
import 'meal_app_bar_back_button.dart';
import 'meal_app_bar_background.dart';
import 'meal_app_bar_overlay_text.dart';
import 'meal_app_bar_title.dart';

class MealSliverAppBar extends StatelessWidget {
  final dynamic meal;
  const MealSliverAppBar({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      expandedHeight: 0.5.sh,
      pinned: true,
      stretch: true,
      backgroundColor: AppColors.transparentColor,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isCollapsed =
              constraints.maxHeight <=
              kToolbarHeight + MediaQuery.of(context).padding.top;
          return Container(
            color: isCollapsed ? AppColors.primaryColor : AppColors.whiteColor,
            child: FlexibleSpaceBar(
              title: isCollapsed
                  ? MealAppBarTitle(mealName: meal.mealName)
                  : const SizedBox(),
              centerTitle: true,
              background: Stack(
                fit: StackFit.expand,
                children: [
                  MealAppBarBackground(meal: meal),
                  MealAppBarOverlayText(),
                  MealAppBarBackButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
