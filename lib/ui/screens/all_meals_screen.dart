import 'package:flutter/material.dart';
import '../widgets/cat_screen_widgets/meal_widgets/meals_grid.dart';
import '../widgets/custom_app_bar.dart';

class AllMealsScreen extends StatelessWidget {
  final String categoryName;
  final TextEditingController searchController;
  const AllMealsScreen({
    super.key,
    required this.categoryName,
    required this.searchController,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: categoryName, showBackButton: true),
      body: MealsGrid(searchController: searchController),
    );
  }
}
