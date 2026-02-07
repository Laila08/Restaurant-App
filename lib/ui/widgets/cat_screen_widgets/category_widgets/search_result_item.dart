import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/models/meal_model.dart';
import '../../../../extensions/app_extensions.dart';
import '../../../../controller/meal_detail_cubit/meal_detail_cubit.dart';
import '../../../../controller/search_cubit/search_cubit.dart';
import '../../../../utils/app_colors.dart';
import '../../../screens/meal_screen.dart';

class SearchResultItem extends StatelessWidget {
  final MealModel meal;
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchResultItem({
    super.key,
    required this.meal,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: 8.radiusAll.toRoundedRectangleBorder(),
      title: Text(
        meal.mealName,
        textDirection: ui.TextDirection.ltr,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      leading: const Icon(Icons.fastfood, color: AppColors.primaryColor),
      onTap: () {
        final mealDetailCubit = context.read<MealDetailCubit>();
        mealDetailCubit.getMealDetailsById(meal);

        final searchCubit = context.read<SearchCubit>();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BlocProvider.value(
              value: mealDetailCubit,
              child: MealScreen(meal: meal),
            ),
          ),
        ).then((_) {
          focusNode.unfocus();
          controller.clear();
          searchCubit.clearResult();
        });
      },
    );
  }
}


