import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/app_colors.dart';

import '../../../extensions/app_extensions.dart';

class CircleIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  const CircleIcon({
    super.key,
    required this.icon,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: 20.h.paddingTop,
        width: 40.w,
        height: 40.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: color, width: 1.w),
          color: AppColors.whiteColor.withValues(alpha: 0.8),
        ),
        child: Icon(icon, size: 20.sp, color: AppColors.primaryColor).centered(),
      ),
    );
  }
}
