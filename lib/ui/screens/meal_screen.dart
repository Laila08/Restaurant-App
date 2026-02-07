import 'package:flutter/material.dart';
import 'package:food_delivery/data/models/meal_model.dart';
import 'package:food_delivery/utils/app_colors.dart';
import '../../controller/meal_detail_cubit/meal_detail_cubit.dart';
import '../widgets/custom_progress.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/meal_details_screen_widgets/meal_bottom_bar.dart';
import '../widgets/meal_details_screen_widgets/meal_info.dart';
import '../widgets/meal_details_screen_widgets/meal_sliver_app_bar.dart';

class MealScreen extends StatelessWidget {
  final MealModel meal;
  const MealScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<MealDetailCubit, MealDetailState>(
        builder: (context, state) {
          if (state is MealDetailLoadingState) {
            return const Center(child: Customprogress());
          } else if (state is MealDetailLoadedState) {
            final meal = state.meal;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    MealSliverAppBar(meal: meal),
                    SliverList(
                      delegate: SliverChildListDelegate([
                        MealInfo(meal: meal),
                      ]),
                    ),
                    const SliverFillRemaining(
                      hasScrollBody: false,
                      child: SizedBox(height: 60),
                    ),
                  ],
                ),
                MealBottomBar(meal: meal),
              ],
            );
          } else if (state is MealDetailErrorState) {
            return const Center(child: Text('Error loading meal'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
