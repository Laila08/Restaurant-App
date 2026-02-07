import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;
import '../../controller/search_cubit/search_cubit.dart';
import '../widgets/cat_screen_widgets/category_widgets/category_content.dart';
import '../widgets/cat_screen_widgets/category_widgets/category_sliver_app_bar.dart';
import '../widgets/cat_screen_widgets/category_widgets/search_results_list.dart';
import '../widgets/cat_screen_widgets/meal_widgets/meals_grid.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();

  @override
  void dispose() {
    searchController.dispose();
    searchFocusNode.dispose();
    super.dispose();
  }

  void removeResult(BuildContext context) {
    searchController.clear();
    searchFocusNode.unfocus();
    context.read<SearchCubit>().clearResult();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () => FocusScope.of(context).unfocus(),
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
                  const CategoryContent(),
                  Expanded(child: MealsGrid(maxItems: 4)),
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
