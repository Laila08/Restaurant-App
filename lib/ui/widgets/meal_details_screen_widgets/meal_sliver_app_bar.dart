import 'package:flutter/material.dart';
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
      expandedHeight: MediaQuery.of(context).size.height * 0.5,
      pinned: true,
      stretch: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          final isCollapsed = constraints.maxHeight <= kToolbarHeight + MediaQuery.of(context).padding.top;

          return Container(
            color: isCollapsed ? AppColors.primaryColor : Colors.white,
            child: FlexibleSpaceBar(
              title: isCollapsed ? MealAppBarTitle(mealName: meal.mealName) : const SizedBox(),
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
