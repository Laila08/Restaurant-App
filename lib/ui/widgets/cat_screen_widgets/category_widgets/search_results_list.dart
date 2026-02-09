import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
import 'package:food_delivery/utils/app_colors.dart';
import '../../../../controller/search_cubit/search_cubit.dart';
import 'search_result_item.dart';

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
          final height = context.height;
          return Positioned(
            top: (height * 0.14).h,
            left: 16.w,
            right: 16.w,
            child: Material(
              elevation: 8,
              color: AppColors.transparentColor,
              borderRadius: 12.r.radiusAll,
              child: Container(
                constraints: BoxConstraints(maxHeight: (height * 0.4).h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: 12.r.radiusAll,
                ),
                child: ListView.separated(
                  padding: 8.h.paddingV,
                  itemCount: state.meals.length,
                  separatorBuilder: (_, _) =>
                      Divider(height: 1.h, color: AppColors.gray300),
                  itemBuilder: (context, index) => SearchResultItem(
                    meal: state.meals[index],
                    controller: controller,
                    focusNode: focusNode,
                  ),
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
