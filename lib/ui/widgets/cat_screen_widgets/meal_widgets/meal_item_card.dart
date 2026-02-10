import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../controller/meal_detail_cubit/meal_detail_cubit.dart';
import '../../../../controller/search_cubit/search_cubit.dart' show SearchCubit;
import '../../../../data/models/meal_model.dart';
import '../../../screens/meal_screen.dart';
import 'meal_card.dart';

class MealItemCard extends StatelessWidget {
  final MealModel meal;
  final TextEditingController searchController;

  const MealItemCard({
    super.key,
    required this.meal,
    required this.searchController,
  });

  void _openMealScreen(BuildContext context) {
    final mealDetailCubit = context.read<MealDetailCubit>();
    mealDetailCubit.getMealDetailsById(meal);

    final navigatorContext = context;
    context.read<SearchCubit>().clearResult();
    searchController.clear();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: mealDetailCubit,
          child: MealScreen(meal: meal),
        ),
      ),
    ).then((_) {
      if (navigatorContext.mounted) {
        FocusScope.of(navigatorContext).unfocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openMealScreen(context),
      child: MealCard(meal: meal),
    );
  }
}
