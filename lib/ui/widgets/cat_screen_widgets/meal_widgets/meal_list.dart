import 'package:flutter/material.dart';

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
            padding: const EdgeInsetsDirectional.fromSTEB(10, 5, 10, 15),
            itemCount: displayCount,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
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
