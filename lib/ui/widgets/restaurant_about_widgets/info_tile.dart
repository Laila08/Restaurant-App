import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/app_colors.dart';
import '../../../theme/app_text_styles.dart';

class InfoTile extends StatelessWidget {
  final IconData icon;
  final String titleKey;
  final String valueKey;

  const InfoTile({
    super.key,
    required this.icon,
    required this.titleKey,
    required this.valueKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.orange100,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Icon(icon, color: AppColors.primaryColor),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                titleKey,
                style: AppTextStyles.infoTitle,
              ),
              SizedBox(height: 4.h),
              Text(
                valueKey,
                style: AppTextStyles.infoValue,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
