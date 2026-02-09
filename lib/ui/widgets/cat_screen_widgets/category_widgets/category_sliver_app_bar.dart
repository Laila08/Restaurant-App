import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/theme/app_text_styles.dart';
import 'package:food_delivery/ui/widgets/cat_screen_widgets/category_widgets/search_field_widget.dart';
import '../../../../controller/search_cubit/search_cubit.dart';
import '../../../../extensions/app_extensions.dart';
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
        height: 200.h,
        child: Stack(
          children: [
            Positioned(
              left: 20.w,
              right: 20.w,
              top: 50.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchFieldWidget(
                    controller: searchController,
                    focusNode: searchFocusNode,
                    onClear: removeResult,
                  ),
                  10.h.vBox,
                  Text(
                    'provide_best_food'.tr(),
                    style: AppTextStyles.font25WhiteWeight600,
                  ),
                  15.h.vBox,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
