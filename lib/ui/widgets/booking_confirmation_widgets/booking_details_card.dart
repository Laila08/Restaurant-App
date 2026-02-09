import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/booking_model.dart';
import '../../../extensions/app_extensions.dart';
import '../../../utils/app_colors.dart';
import 'booking_details_list.dart';

class BookingDetailsCard extends StatelessWidget {
  final BookingModel booking;
  const BookingDetailsCard({super.key, required this.booking});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: 20.w.paddingAll,
      padding: 20.w.paddingAll,
      decoration: BoxDecoration(
        color: AppColors.orange100,
        borderRadius: 20.r.radiusAll,
        boxShadow: [
          BoxShadow(
            color: AppColors.orange100,
            blurRadius: 15.r,
            offset: Offset(0, 5.h),
          ),
        ],
        border: Border.all(color: AppColors.primaryColor, width: 2.w),
      ),
      child: BookingDetailsList(booking: booking),
    );
  }
}
