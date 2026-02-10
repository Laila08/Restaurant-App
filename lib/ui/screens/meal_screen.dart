import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/data/models/meal_model.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/utils/app_colors.dart';
import '../../controller/meal_detail_cubit/meal_detail_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/meal_details_screen_widgets/meal_bottom_bar.dart';
import '../widgets/meal_details_screen_widgets/meal_info.dart';
import '../widgets/meal_details_screen_widgets/meal_sliver_app_bar.dart';
import '../widgets/meal_info_shimmer.dart';

class MealScreen extends StatelessWidget {
  final MealModel meal;
  const MealScreen({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: BlocBuilder<MealDetailCubit, MealDetailState>(
        buildWhen: (previous, current) =>
            current is MealDetailLoadedState ||
            current is MealDetailLoadedState,
        builder: (context, state) {
          if (state is MealDetailLoadingState) {
            return MealInfoShimmer();
          } else if (state is MealDetailLoadedState) {
            final meal = state.meal;
            return Stack(
              children: [
                CustomScrollView(
                  slivers: [
                    MealSliverAppBar(meal: meal),
                    SliverList(
                      delegate: SliverChildListDelegate([MealInfo(meal: meal)]),
                    ),
                    SliverFillRemaining(hasScrollBody: false, child: 60.h.vBox),
                  ],
                ),
                MealBottomBar(meal: meal),
              ],
            );
          } else if (state is MealDetailErrorState) {
            return Text("error_loading_meals".tr()).centered();
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
