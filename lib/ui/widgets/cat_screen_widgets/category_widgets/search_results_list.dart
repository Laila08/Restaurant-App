import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../controller/meal_detail_cubit/meal_detail_cubit.dart';
import '../../../../controller/search_cubit/search_cubit.dart';
import '../../../../utils/app_colors.dart';
import '../../../screens/meal_screen.dart';

class SearchResultsList extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchResultsList({
    super.key,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoadedState && state.showResults) {
          final size = MediaQuery.of(context).size;
          return Positioned(
            top: size.height * 0.14,
            left: 16,
            right: 16,
            child: Material(
              elevation: 8,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                constraints: BoxConstraints(maxHeight: size.height * 0.4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: state.meals.length,
                  separatorBuilder: (_, _) =>
                      Divider(height: 1, color: Colors.grey.shade300),
                  itemBuilder: (context, index) {
                    final meal = state.meals[index];
                    return ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      title: Text(
                        meal.mealName,
                        textDirection: ui.TextDirection.ltr,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: Icon(
                        Icons.fastfood,
                        color: AppColors.primaryColor,
                      ),
                        onTap: () {
                          final mealDetailCubit = context.read<MealDetailCubit>();

                          mealDetailCubit.getMealDetailsById(meal);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                value: mealDetailCubit,
                                child: MealScreen(
                                 meal: meal,
                                ),
                              ),
                            ),
                          ).then((_) {
                            focusNode.unfocus();
                            controller.clear();
                            context.read<SearchCubit>().clearResult();
                          });
                        }
                    );
                  },
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
