import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/category_cubit/category_cubit.dart';
import '../../controller/meal_cubit/meal_cubit.dart';
import '../../controller/search_cubit/search_cubit.dart';
import '../widgets/cat_screen_widgets/category_widgets/category_section.dart';
import '../widgets/cat_screen_widgets/category_widgets/category_sliver_app_bar.dart';
import '../widgets/cat_screen_widgets/category_widgets/search_results_list.dart';
import '../widgets/cat_screen_widgets/meal_widgets/meals_grid.dart';
import 'all_meals_screen.dart';
import 'dart:ui' as ui;

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  final FocusNode searchFocusNode = FocusNode();

  void removeResult(BuildContext context) {
    searchController.clear();
    searchFocusNode.unfocus();
    context.read<SearchCubit>().clearResult();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: context.locale.languageCode == 'ar'
          ? ui.TextDirection.rtl
          : ui.TextDirection.ltr,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Column(
                children: [
                  CategorySliverAppBar(
                    searchController: searchController,
                    searchFocusNode: searchFocusNode,
                    removeResult: () => removeResult(context),
                  ),
                  CategorySection(),

                  Expanded(
                    child: MealsGrid(
                      maxItems: 4,
                      onSeeMore: () {
                        final categoryState = context
                            .read<CategoryCubit>()
                            .state;
                        if (categoryState is CategoryLoadedState) {
                          final selectedCategory =
                              categoryState.selectedCategory;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BlocProvider.value(
                                value: BlocProvider.of<MealCubit>(context)
                                  ..getMealData(selectedCategory),
                                child: AllMealsScreen(
                                  categoryName: selectedCategory,
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              SearchResultsList(
                controller: searchController,
                focusNode: searchFocusNode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
