import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:food_delivery/theme/app_text_styles.dart';

import '../../../../utils/app_colors.dart';

class CategoryHeader extends StatelessWidget {
  final bool showAsGrid;
  final VoidCallback onToggle;

  const CategoryHeader({
    super.key,
    required this.showAsGrid,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
      child: Row(
        children: [
          Text(
            'find_by_category'.tr(),
            style: AppTextStyles.font17PrimaryWeight600,
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              showAsGrid ? Icons.view_list : Icons.grid_view,
              color: AppColors.primaryColor,
            ),
            onPressed: onToggle,
          ),
        ],
      ),
    );
  }
}
