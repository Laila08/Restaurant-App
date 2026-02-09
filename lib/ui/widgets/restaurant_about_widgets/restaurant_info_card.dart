import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery/utils/app_colors.dart';
import '../../../theme/app_text_styles.dart';
import 'info_tile.dart';

class RestaurantInfoCard extends StatelessWidget {
  const RestaurantInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.r),
      decoration: BoxDecoration(
        color: AppColors.orange50,
        borderRadius: BorderRadius.circular(22.r),
        border: Border.all(color: AppColors.orange, width: 2.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.orange50.withOpacity(0.25),
            blurRadius: 14.r,
            offset: Offset(0, 6.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "about_restaurant_name".tr(),
            style: AppTextStyles.restaurantName,
          ),
          SizedBox(height: 12.h),
          Text(
            "about_restaurant_description".tr(),
            style: AppTextStyles.font15Black87,
          ),
          SizedBox(height: 20.h),
          InfoTile(
            icon: Icons.location_on,
            titleKey: "about_restaurant_location_title".tr(),
            valueKey: "about_restaurant_location_value".tr(),
          ),
          SizedBox(height: 12.h),
          InfoTile(
            icon: Icons.access_time,
            titleKey: "about_restaurant_working_hours_title".tr(),
            valueKey: "about_restaurant_working_hours_value".tr(),
          ),
          SizedBox(height: 12.h),
          InfoTile(
            icon: Icons.phone,
            titleKey: "about_restaurant_phone_title".tr(),
            valueKey: "about_restaurant_phone_value".tr(),
          ),
        ],
      ),
    );
  }
}
