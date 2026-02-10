import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/extensions/app_extensions.dart';
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
          padding: 10.w.paddingAll,
          decoration: BoxDecoration(
            color: AppColors.orange100,
            borderRadius: 14.r.radiusAll,
          ),
          child: Icon(icon, color: AppColors.primaryColor),
        ),
        12.w.hBox,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleKey, style: AppTextStyles.infoTitle),
              4.h.vBox,
              Text(valueKey, style: AppTextStyles.infoValue),
            ],
          ),
        ),
      ],
    );
  }
}
