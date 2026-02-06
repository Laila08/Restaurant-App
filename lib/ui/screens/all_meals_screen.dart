import 'package:flutter/material.dart';
import '../widgets/cat_screen_widgets/meal_widgets/meals_grid.dart';

class AllMealsScreen extends StatelessWidget {
  final String categoryName;
  const AllMealsScreen({super.key, required this.categoryName,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All $categoryName"),
      ),
      body: MealsGrid(),
    ) ;
  }
}
