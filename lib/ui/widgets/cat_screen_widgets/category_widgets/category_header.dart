import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: Row(
        children: [
          Text(
            'find_by_category'.tr(),
            style: TextStyle(
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
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
