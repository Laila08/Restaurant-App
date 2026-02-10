import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../extensions/app_extensions.dart';
import '../category_widgets/search_result_item.dart';
import 'package:food_delivery/utils/app_colors.dart';

class SearchListWidget extends StatelessWidget {
  final List meals;
  final TextEditingController controller;
  final FocusNode focusNode;

  const SearchListWidget({
    super.key,
    required this.meals,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
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
            color: AppColors.gray100,
            borderRadius: 12.r.radiusAll,
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withValues(alpha: 0.05),
                blurRadius: 8.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: ListView.separated(
            padding: 8.h.paddingV,
            itemCount: meals.length,
            separatorBuilder: (_, _) =>
                Divider(height: 1.h, color: AppColors.gray300),
            itemBuilder: (context, index) => SearchResultItem(
              meal: meals[index],
              controller: controller,
              focusNode: focusNode,
            ),
          ),
        ),
      ),
    );
  }
}
