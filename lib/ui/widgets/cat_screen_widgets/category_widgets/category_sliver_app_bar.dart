import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/ui/widgets/cat_screen_widgets/category_widgets/search_field_widget.dart';
import '../../../../controller/search_cubit/search_cubit.dart';
import '../../../../extensions/app_extensions.dart';
import '../../../../utils/app_colors.dart';
import 'category_app_bar_background.dart';
class CategorySliverAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final VoidCallback removeResult;

  const CategorySliverAppBar({
    super.key,
    required this.searchController,
    required this.searchFocusNode,
    required this.removeResult,
  });

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is UserScrollNotification &&
            scrollNotification.direction != ScrollDirection.idle) {
          context.read<SearchCubit>().clearResult();
          searchController.clear();
          FocusScope.of(context).unfocus();
        }
        return false;
      },
      child: CategoryAppBarBackground(
        height: 200.d,
        child: Stack(
          children: [
            Positioned(
              left: 20.d,
              right: 20.d,
              top: 50.d,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchFieldWidget(
                    controller: searchController,
                    focusNode: searchFocusNode,
                    onClear: removeResult,
                  ),
                  10.vBox,
                  Text(
                    'provide_best_food'.tr(),
                    style: const TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                  ),
                  15.vBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
